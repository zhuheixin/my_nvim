-- 默认不开启nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") 

require("nvim-tree").setup() 
