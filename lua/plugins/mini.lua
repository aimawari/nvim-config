return {
  src = 'https://github.com/nvim-mini/mini.nvim',
  version = 'main',
  data = {
    setup = function()
      require('mini.completion').setup()
      require('mini.pick').setup()
      require('mini.pairs').setup()
      require('mini.diff').setup()
      require('mini.notify').setup()
      require('mini.indentscope').setup()
      require('mini.statusline').setup()
      require('mini.hipatterns').setup {
        highlighters = {
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

          hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
        },
      }

      local autocmd = vim.api.nvim_create_autocmd
      local augroup = vim.api.nvim_create_augroup
      local keymap_set = vim.keymap.set

      keymap_set({ 'n', 'v' }, '<leader>sw', function() MiniPick.builtin.grep { pattern = vim.fn.expand '<cword>' } end, { desc = '[S]earch current [W]ord' })
      keymap_set('n', '<leader>sh', function() MiniPick.builtin.help() end, { desc = '[S]earch [H]elp' })
      keymap_set('n', '<leader>sk', function() MiniPick.builtin.keymaps() end, { desc = '[S]earch [K]eymaps' })
      keymap_set('n', '<leader>sf', function() MiniPick.builtin.files() end, { desc = '[S]earch [F]iles' })
      keymap_set('n', '<leader>sb', function() MiniPick.builtin.builtin() end, { desc = '[S]earch [B]uiltin Pickers' })
      keymap_set('n', '<leader>sg', function() MiniPick.builtin.grep_live() end, { desc = '[S]earch by [G]rep' })
      keymap_set('n', '<leader>sd', function() MiniPick.builtin.diagnostic() end, { desc = '[S]earch [D]iagnostics' })
      keymap_set('n', '<leader>s.', function() MiniPick.builtin.oldfiles() end, { desc = '[S]earch Recent Files' })
      keymap_set('n', '<leader>sc', function() MiniPick.builtin.commands() end, { desc = '[S]earch [C]ommands' })
      keymap_set('n', '<leader><leader>', function() MiniPick.builtin.buffers() end, { desc = 'Find existing buffers' })

      autocmd('LspAttach', {
        group = augroup('minipick-lsp-attach', { clear = true }),
        callback = function(event)
          local buf = event.buf

          keymap_set('n', 'grr', function() MiniPick.builtin.lsp { scope = 'references' } end, { buffer = buf, desc = '[G]oto [R]eferences' })
          keymap_set('n', 'gri', function() MiniPick.builtin.lsp { scope = 'implementation' } end, { buffer = buf, desc = '[G]oto [I]mplementation' })
          keymap_set('n', 'grd', function() MiniPick.builtin.lsp { scope = 'definition' } end, { buffer = buf, desc = '[G]oto [D]efinition' })
          keymap_set('n', 'grt', function() MiniPick.builtin.lsp { scope = 'type_definition' } end, { buffer = buf, desc = '[G]oto [T]ype Definition' })

          keymap_set('n', 'gO', function() MiniPick.builtin.lsp_document_symbols() end, { buffer = buf, desc = 'Open Document Symbols' })
          keymap_set('n', 'gW', function() MiniPick.builtin.lsp_dynamic_workspace_symbols() end, { buffer = buf, desc = 'Open Workspace Symbols' })

          keymap_set('i', '<C-Space>', vim.lsp.completion.get, { buffer = buf, desc = 'Trigger LSP Completion' })
        end,
      })
    end,
  },
}
