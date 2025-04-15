-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  "folke/tokyonight.nvim", -- 主题
  "nvim-lualine/lualine.nvim",  -- 状态栏
  "nvim-treesitter/nvim-treesitter", -- 语法高亮
  {
     'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  --{
  --  'neoclide/coc.nvim',
  --  branch = 'release',
  --},
 
  -- mason 插件
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
  },
  
  {"lewis6991/gitsigns.nvim"},
  -- 格式化插件
  {"nvimtools/none-ls.nvim"},

  -- 自动补全
   {"hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
  "hrsh7th/cmp-path", -- 文件路径
  "hrsh7th/cmp-buffer",     -- 缓冲区补全
  "hrsh7th/cmp-cmdline",},    -- 命令行补全
  -- gdb 
  {"sakhnik/nvim-gdb"},
  -- flash.nvim 配置
  {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {   
    },

  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
},
  -- 文档树
  "nvim-tree/nvim-tree.lua",  -- 文档树
  "nvim-tree/nvim-web-devicons", -- 文档树图标 

    -- copilot
    --{
    --    "CopilotC-Nvim/CopilotChat.nvim",
    --    dependencies = {
    --        { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
    --        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    --    },
    --    build = "make tiktoken", -- Only on MacOS or Linux
    --    opts = {
    --        -- See Configuration section for options
    --    },
    --    -- See Commands section for default commands if you want to lazy load on them
    --},
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
}

local opts = {} -- 注意要定义这个变量

require("lazy").setup(plugins, opts)
