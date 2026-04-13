return {
  src = 'https://github.com/mason-org/mason.nvim',
  data = {
    setup = function() require('mason').setup() end,
  },
}
