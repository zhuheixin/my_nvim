-- 载入 gruvbox 主题的设置
require("gruvbox").setup({
  terminal_colors = true, -- 让 Neovim 的终端（`:terminal`）使用 Gruvbox 主题的配色
  undercurl = false,       -- 启用 undercurl（波浪下划线）
  underline = false,       -- 启用普通下划线
  bold = false,            -- 启用加粗文本
  
  italic = {
    strings = false,      -- 让字符串（"hello"）使用斜体
    emphasis = false,     -- 让强调的文本使用斜体
    comments = false,     -- 让注释（`--` 或 `#`）使用斜体
    operators = false,   -- 不让操作符（`+`, `-`, `*`, `/` 等）使用斜体
    folds = false,        -- 让折叠的代码行使用斜体
  },

  strikethrough = true,  -- 允许使用删除线（适用于 GUI）
  invert_selection = false, -- 选中文本时不反转颜色（false = 保持默认高亮）
  invert_signs = false,  -- 不反转 LSP 诊断符号的颜色（`:signcolumn`）
  invert_tabline = false, -- 不反转 Tabline（标签栏）的颜色
  invert_intend_guides = false, -- 不反转缩进指示线（indent guide）

  inverse = false, -- 反转搜索高亮、diff 变更、状态栏和错误提示的背景颜色

  contrast = "", -- 主题对比度，可选值："hard"（高对比度）, "soft"（低对比度）或 ""（默认）

  palette_overrides = {
     bg = "#000000"
   }, -- 可用于手动调整 Gruvbox 颜色
  overrides = {
    Normal = { bg = "#000000" },       -- 确保普通文本背景为黑色
    NormalNC = { bg = "#000000" },     -- 非活动窗口背景设为黑色
    SignColumn = { bg = "#000000" },   -- 诊断符号栏背景
    StatusLine = { bg = "#000000" },   -- 状态栏背景
    StatusLineNC = { bg = "#000000" }, -- 非活动状态栏背景
    VertSplit = { bg = "#000000" },    -- 窗口分割线背景
    TabLine = { bg = "#000000" },      -- 标签栏背景
    TabLineFill = { bg = "#000000" },  -- 标签栏填充背景
    TabLineSel = { bg = "#000000" },   -- 选中的标签背景
    FoldColumn = { bg = "#000000" },   -- 折叠符号栏背景
    CursorLine = { bg = "#000000" },   -- 当前行高亮背景
    CursorColumn = { bg = "#000000" }, -- 当前列高亮背景
    Pmenu = { bg = "#000000" },        -- 弹出菜单背景
    PmenuSel = { bg = "#000000" },     -- 选中的弹出菜单项背景

  }, -- 允许覆盖默认的 Neovim UI 组件的颜色

  dim_inactive = false, -- false = 非活动窗口不变暗
  transparent_mode = false, -- false = 关闭透明模式（true = 背景透明）
})

-- 设置颜色主题为 Gruvbox
vim.cmd("colorscheme gruvbox")

vim.cmd("highlight GruvboxRedSign guibg=#000000 ctermbg=0") 
vim.cmd("highlight GruvboxBlueSign ctermbg=0 guibg=#000000") 
vim.cmd("highlight GruvboxAquaSign ctermbg=0 guibg=#000000") 

