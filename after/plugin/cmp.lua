-- Completion setup. Previously handled by lsp-zero's `setup_nvim_cmp()`;
-- configured directly now that lsp-zero is gone.

local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer', keyword_length = 3 },
  }),

  -- preset.insert maps <Down> <Up> <C-n> <C-p> <C-y> <C-e> only -- it never
  -- touches <Tab>, so copilot.vim keeps <Tab> without any explicit unmapping.
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  }),

  completion = {
    completeopt = 'menu,menuone,noinsert',
  },

  window = {
    documentation = cmp.config.window.bordered(),
  },
})
