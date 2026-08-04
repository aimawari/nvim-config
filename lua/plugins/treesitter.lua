return {
  src = 'https://github.com/nvim-treesitter/nvim-treesitter',
  version = 'main',
  data = {
    setup = function()
      local filetypes = {
        'bash',
        'c',
        'cmake',
        'cpp',
        'css',
        'dart',
        'diff',
        'dockerfile',
        'html',
        'json',
        'kotlin',
        'lua',
        'luadoc',
        'make',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'rust',
        'ruby',
        'swift',
        'toml',
        'tsx',
        'vim',
        'vimdoc',
        'yaml',
      }

      require('nvim-treesitter').install(filetypes)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
}
