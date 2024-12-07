require('gitsigns').setup({
  signs = {
    add          = { text = '' },
    change       = { text = '' },
    delete       = { text = '' },
    topdelete    = { text = '' },
    changedelete = { text = '' },
    untracked    = { text = '' },
  },
  signs_staged = {
    add          = { text = '' },
    change       = { text = '' },
    delete       = { text = '' },
    topdelete    = { text = '' },
    changedelete = { text = '' },
    untracked    = { text = '' },
  },
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = true, -- Toggle with `:Gitsigns toggle_word_diff`
})
