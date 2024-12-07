require("plugins.plug_init")

require("config.options")
require("config.keymaps")

-- 一些插件 
require("plugins/tokyonight") 
vim.cmd([[colorscheme tokyonight-night]])

require("plugins/lualine") 
require("plugins/nvim-treesitter") 
require("plugins/telescope") 
require("plugins/gitsigns")
require("plugins/lsp")
--require("plugins/java")
require("plugins/cmp")
