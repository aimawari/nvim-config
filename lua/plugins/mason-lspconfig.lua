return {
  src = 'https://github.com/mason-org/mason-lspconfig.nvim',
  data = {
    setup = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'clangd', 'pyright', 'lua_ls', 'kotlin_language_server' },
      }
    end,
  },
}
