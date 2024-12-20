require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	-- 确保安装，根据需要填写
	ensure_installed = {
		"clangd",
		"pyright",
	},
})

--local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").clangd.setup({
	flags = {
		debounce_text_changes = 1000,
	},
	cmd = { "clangd", "--background-index", "--compile-commands-dir=build", "--pch-storage=memory", "--j=2" },
	filetypes = { "c", "cc", "cpp", "objc", "objcpp", "cuda", "proto" },
})

require("lspconfig").pyright.setup({})

-- 定义生成编译命令的函数
local function generate_compile_commands()
	-- 检查是否存在 CMakeLists.txt 文件
	if vim.fn.empty(vim.fn.glob("CMakeLists.txt")) == 1 then
		print("Can't find CMakeLists.txt")
		return
	end

	-- 检查是否存在 build 目录
	if vim.fn.empty(vim.fn.glob("build")) == 1 then
		vim.fn.system("mkdir build")
	end

	-- 执行 cmake 命令
	local command = "cmake -DCMAKE_BUILD_TYPE=debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B build"
	os.execute(command)
end

local options = { noremap = true, silent = true }
-- 错误提示显示在行号上
vim.opt.signcolumn = "number" -- 或 'yes'
-- LSP config mappings
vim.api.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", options)
vim.api.nvim_set_keymap("n", "gde", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", options)
vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)

-- Diagnostics
vim.api.nvim_set_keymap("n", "gw", "<cmd>lua vim.diagnostic.open_float(nil, { focusable = false })<CR>", options)
vim.api.nvim_set_keymap("n", "g=", "<cmd>lua vim.diagnostic.goto_next()<CR>", options)
vim.api.nvim_set_keymap("n", "g-", "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)
-- format
vim.api.nvim_set_keymap("n", "<leader>f=", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", options)
-- 禁用显示错误和警告
vim.diagnostic.config({
	virtual_text = false, -- 禁用显示行内错误和警告
	signs = true, -- 禁用行号旁边的标志（如红色错误标记）
	underline = true, -- 禁用下划线错误
	update_in_insert = false, -- 在插入模式下不更新诊断
	severity_sort = false, -- 不按照严重性排序诊断信息
})
