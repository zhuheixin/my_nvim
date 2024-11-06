--require('lualine').setup({
--  options = {
--    theme = 'tokyonight'
--  }
--})
require('lualine').setup {
  options = {
    theme = 'tokyonight',  -- 或者你喜欢的其他主题
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        path = 1,  -- 设置为 1 以显示绝对路径
        color = { bg = "#303034" }
      }
    },

    lualine_x = {
      { 'encoding', color = { bg = "#303034" } },
      { 'fileformat', color = { bg = "#303034" } },
      { 'filetype', color = { bg = "#303034" } },
    },

    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

