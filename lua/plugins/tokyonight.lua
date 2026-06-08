return {
  src = 'https://github.com/folke/tokyonight.nvim',
  data = {
    setup = function()
      require('tokyonight').setup {
        transparent = true,
      }

      vim.cmd.colorscheme 'tokyonight-storm'
    end,
  },
}
