vim.g.mapleader = " "

local keymap = vim.keymap
local api = vim.api

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<C-l>", ":bnext<CR>")
keymap.set("n", "<C-h>", ":bprevious<CR>")

-- 设置搜索后高亮取消
api.nvim_set_keymap('n', '<leader>nh', ':set nohlsearch<CR>', { noremap = true, silent = true })

-- 映射 H 到行首
api.nvim_set_keymap('n', 'H', '0', { noremap = true, silent = true })

-- 映射 L 到行尾
api.nvim_set_keymap('n', 'L', '$', { noremap = true, silent = true })

-- ---------- 插件 ---------- ---
-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
