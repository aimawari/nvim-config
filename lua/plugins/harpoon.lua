return {
  src = 'https://github.com/ThePrimeagen/harpoon',
  version = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  data = {
    setup = function()
      local harpoon = require 'harpoon'
      local keymap_set = vim.keymap.set

      harpoon:setup {
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        },
      }

      -- Keymaps (grouped)
      keymap_set('n', '<leader>na', function() harpoon:list():add() end, { desc = 'Harpoon add file' })
      keymap_set('n', '<leader>ne', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon menu' })

      keymap_set('n', '<leader>nh', function() harpoon:list():select(1) end, { desc = 'Harpoon file 1' })
      keymap_set('n', '<leader>nj', function() harpoon:list():select(2) end, { desc = 'Harpoon file 2' })
      keymap_set('n', '<leader>nk', function() harpoon:list():select(3) end, { desc = 'Harpoon file 3' })
      keymap_set('n', '<leader>nl', function() harpoon:list():select(4) end, { desc = 'Harpoon file 4' })

      keymap_set('n', '<leader>np', function() harpoon:list():prev() end, { desc = 'Harpoon previous' })
      keymap_set('n', '<leader>nn', function() harpoon:list():next() end, { desc = 'Harpoon next' })
    end,
  },
}
