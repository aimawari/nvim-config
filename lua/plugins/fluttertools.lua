return {
  src = 'https://github.com/nvim-flutter/flutter-tools.nvim',
  data = {
    setup = function()
      vim.api.nvim_set_hl(0, 'FlutterWidgetGuides', { fg = '#303030' })

      vim.keymap.set('n', '<leader>fl', function()
        -- flutter-tools only registers its :Flutter* commands on entering a
        -- *.dart/pubspec.yaml buffer; fake that event so the commands exist
        -- even when this is invoked from netrw or another non-dart buffer.
        vim.api.nvim_exec_autocmds('BufEnter', { pattern = 'pubspec.yaml' })

        local pick = require 'mini.pick'

        local flutter_cmds = {
          'FlutterRun',
          'FlutterReload',
          'FlutterRestart',
          'FlutterDevices',
          'FlutterEmulators',
          'FlutterQuit',
          'FlutterAttach',
          'FlutterDetach',
          'FlutterLogToggle',
          'FlutterDevTools',
        }

        pick.start {
          source = {
            items = flutter_cmds,
            name = 'Flutter Commands',
            choose = function(item) vim.cmd(item) end,
          },
        }
      end, { desc = '[F][L]utter commands' })

      require('flutter-tools').setup {
        fvm = false,
        root_patterns = { '.git', 'pubspec.yaml' },
        widget_guides = { enabled = true },
        closing_tags = {
          enabled = true,
          highlight = 'LineNr',
          prefix = '>> ',
          priority = 10,
        },
        dev_log = {
          enabled = false,
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
            project_config = true,
          },
        },
        lsp = {
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = {
              vim.fn.expand '~/.pub-cache',
              -- vim.fn.expand("~/.asdf/installs/flutter"),
            },
            renameFilesWithClasses = 'prompt',
            updateImportsOnRename = true,
            enableSnippets = false,
          },
        },
        debugger = {
          enabled = true,
          exception_breakpoints = {},
          evaluate_to_string_in_debug_views = true,
          register_configurations = function(paths)
            local dap = require 'dap'
            dap.adapters.dart = {
              type = 'executable',
              command = paths.flutter_bin,
              args = { 'debug-adapter' },
            }
            dap.configurations.dart = require('dap.ext.vscode').getconfigs() or {}
          end,
        },
      }
    end,
  },
}
