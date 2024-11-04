require("tokyonight").setup({
  -- use the night style
  style = "night",
  -- disable italic for functions
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    functions = { italic = false },
    variables = { italic = false },
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.bg = "#171717"   
    colors.fg = "#dadada"   
  end,

  on_highlights = function(highlights, colors)
    highlights.Search = { bg = "#f9d28b", fg = "#FFFFFF" }  -- 设置 Search 的背景和前景色
    highlights.IncSearch = { bg = "#fef895", fg = "#FFFFFF" }  -- 设置 IncSearch 的背景和前景色
    highlights.String = { fg = "#c79ae5", bg = "NONE" }  -- 设置字符串的颜色
    highlights.Keyword = { fg = "#eee5b2", bg = "NONE"}
    highlights["@keyword"] = { fg = "#eee5b2", bg = "NONE"}
    highlights["@type"] = { fg = "#82f4a8", bg = "NONE" }  -- 绿色
    highlights["@type.builtin"] = { fg = "#82f4a8", bg = "NONE" }  -- 绿色
    highlights.Type = { fg = "#82f4a8", bg = "NONE" }  -- 绿色
    highlights.Constant = { fg = "#FFB6C1", bg = "NONE" }  -- 设置常量为粉色
    highlights.Visual = { fg = "#eaeaea",bg = "#A9A9A9"}
  end
})
