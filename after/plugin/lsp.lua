-- ╭──────────────────────────────────────────────────────────╮
-- │  Native LSP setup (Neovim 0.11+ vim.lsp.config API)      │
-- │  Migrated off lsp-zero.nvim v2.x, which is unmaintained   │
-- │  and calls the deprecated require('lspconfig') framework. │
-- ╰──────────────────────────────────────────────────────────╯

if vim.fn.has('nvim-0.11') == 0 then
  vim.notify(
    'lsp.lua requires Neovim 0.11+ for vim.lsp.config. LSP is disabled.',
    vim.log.levels.WARN
  )
  return
end

--------------------------------------------------------------------------------
--  Server installation (mason)
--------------------------------------------------------------------------------

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'rust_analyzer',
    'lua_ls',
  },
  -- Calls vim.lsp.enable() for every installed server, using the config
  -- specs that nvim-lspconfig ships in its `lsp/` directory.
  automatic_enable = true,
})

--------------------------------------------------------------------------------
--  Shared config for every server
--------------------------------------------------------------------------------

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok_cmp_lsp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if ok_cmp_lsp then
  capabilities = vim.tbl_deep_extend('force', capabilities, cmp_lsp.default_capabilities())
end

vim.lsp.config('*', {
  capabilities = capabilities,
})

--------------------------------------------------------------------------------
--  Per-server overrides
--------------------------------------------------------------------------------

-- Fix "Undefined global `vim`" and teach lua_ls about the Neovim runtime.
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

--------------------------------------------------------------------------------
--  Buffer-local keymaps on attach
--------------------------------------------------------------------------------

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('geo_lsp_attach', { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf, remap = false }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>lws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set('n', '<leader>lsa', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>lrr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
  end,
})

--------------------------------------------------------------------------------
--  Diagnostics
--------------------------------------------------------------------------------

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN]  = 'W',
      [vim.diagnostic.severity.HINT]  = 'H',
      [vim.diagnostic.severity.INFO]  = 'I',
    },
  },
  severity_sort = true,
})
