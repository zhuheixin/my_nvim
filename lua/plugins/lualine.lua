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
        path = 1  -- 设置为 1 以显示绝对路径
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

