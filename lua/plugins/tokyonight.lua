return {
  src = 'https://github.com/folke/tokyonight.nvim',
  data = {
    setup = function() vim.cmd.colorscheme 'tokyonight-night' end,
  },
}
