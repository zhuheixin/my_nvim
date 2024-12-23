require("plugins.plug_init")

require("config.options")
require("config.keymaps")

-- 一些插件 
require("plugins/tokyonight") 
vim.cmd([[colorscheme tokyonight-night]])

require("plugins/lualine") 
require("plugins/nvim-treesitter") 
require("plugins/telescope") 
require("plugins/cocnvim") 
require("plugins/gitsigns")
