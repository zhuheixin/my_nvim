-- coc.nvim 配置
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-vimlsp',
  'coc-cmake',
  'coc-sh'
}

-- 设置 signcolumn
vim.opt.signcolumn = 'number'  -- 或 'yes'

-- 设置快捷键
local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gl", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- 设置tab补全
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- 按enter确认
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts) 

-- 设置快速修复功能
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- 设置跳转到上一个错误，下一个错误
keyset("n", "<leader>-", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "<leader>=", "<Plug>(coc-diagnostic-next)", {silent = true})

-- 定义生成编译命令的函数
local function generate_compile_commands()
    -- 检查是否存在 CMakeLists.txt 文件
    if vim.fn.empty(vim.fn.glob('CMakeLists.txt')) == 1 then
        print("Can't find CMakeLists.txt")
        return
    end

    -- 检查是否存在 build 目录
    if vim.fn.empty(vim.fn.glob('build')) == 1 then
        vim.fn.system('mkdir build')
    end

    -- 执行 cmake 命令
    local command = 'cmake -DCMAKE_BUILD_TYPE=debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B build'
    os.execute(command)
end

-- 创建命令 Gcmake
vim.api.nvim_create_user_command('Gcmake', generate_compile_commands, {})
