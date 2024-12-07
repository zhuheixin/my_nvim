local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

-- 下面会用到这个函数
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  -- 禁用 tree-sitter 更新
  experimental = {
    native_menu = false,   -- 使用原生菜单而非 tree-sitter 解析
  },
    window = {
      -- completion = cmp.config.window.bordered(),
      --  documentation = cmp.config.window.bordered(),
    },

  completion = {
    keyword_length = 1,  -- Set the minimum number of characters for triggering completion
    max_item_count = 10,
    autocomplete = false,
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),  -- 取消补全，esc也可以退出
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- 用 Tab 触发补全菜单
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()  -- 补全菜单中选择下一个补全项
      elseif has_words_before() then
        cmp.complete()
        cmp.select_next_item()
      else
        fallback()  -- 显示补全菜单
      end
    end, { "i", "s" }),

   -- ["<Tab>"] = cmp.mapping(function(fallback)
   --   if cmp.visible() then
   --     cmp.select_next_item()
   --   elseif luasnip.expandable() then
   --     luasnip.expand()
   --   elseif luasnip.expand_or_jumpable() then
   --     luasnip.expand_or_jump()
   --   elseif has_words_before() then
   --     cmp.complete()
   --   elseif check_backspace() then
   --     fallback()
   --   else
   --     fallback()
   --   end
   -- end, {
   --   "i",
   --   "s",
   -- }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  }),

  -- 这里重要
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
   --j { name = 'luasnip' },
    { name = 'path' },
  } ) 
-- {
--    { name = 'buffer' },
--  }

})
