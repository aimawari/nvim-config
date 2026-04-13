return {
  src = 'https://github.com/folke/which-key.nvim',
  data = {
    setup = function()
      require('which-key').setup {

        delay = 0,
        icons = { mappings = vim.g.have_nerd_font },
        preset = 'helix',
        spec = {
          {
            '<leader>?',
            function() require('which-key').show { global = false } end,
            desc = 'Buffer Local Keymaps (which-key)',
          },
          { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
          { '<leader>t', group = '[T]oggle' },
          { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
          { '<leader>n', group = 'Harpoo[N]', mode = { 'n', 'v' } },
          { '<leader>g', group = 'Fu[G]itive', mode = { 'n', 'v' } },
        },
      }
    end,
  },
}
