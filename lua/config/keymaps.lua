vim.g.mapleader = ","

local keymap = vim.keymap
local api = vim.api

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<C-l>", ":bnext<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-h>", ":bprevious<CR>", { noremap = true, silent = true })
keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })

-- 设置搜索后高亮取消
api.nvim_set_keymap('n', '<leader>nh', ':set nohlsearch<CR>', { noremap = true, silent = true })

-- 映射 H 到行首
api.nvim_set_keymap('n', 'H', '^', { noremap = true, silent = true })

-- 映射 L 到行尾
api.nvim_set_keymap('n', 'L', '$', { noremap = true, silent = true })

-- ---------- 插件 ---------- ---
-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- 定义通用的 pdb_run 命令
api.nvim_create_user_command(
    'Pdb',
    function(opts)
        local script = opts.args -- 获取用户输入的脚本名称
        if script == "" then
            print("Error: Please provide a script name, e.g., :PdbRun my_script.py")
            return
        end
        vim.cmd("GdbStartPDB python -m pdb " .. script)
    end,
    { nargs = 1 } -- 必须提供一个参数
)


-- 设置term模式下的快捷推出
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
