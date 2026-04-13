return {
  src = 'https://github.com/mason-org/mason-lspconfig.nvim',
  data = {
    setup = function() require('mason-lspconfig').setup() end,
  },
}
