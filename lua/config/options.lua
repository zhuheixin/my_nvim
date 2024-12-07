local opt = vim.opt
-- 行号
opt.relativenumber = false
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = false

-- 启用鼠标
-- opt.mouse:append("a")

-- 禁用鼠标
opt.mouse = ""


-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = flase

-- 设置光标形状
opt.guicursor = "n-v-c:block,i:block,r-cr:hor20"
