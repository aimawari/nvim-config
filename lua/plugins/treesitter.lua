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
        'lua',
        'luadoc',
        'make',
        'markdown',
        'markdown_inline',
        'query',
        'regex',
        'rust',
        'ruby',
        'swift',
        'toml',
        'tsx',
        'vim',
        'vimdoc',
      }

      require('nvim-treesitter').install(filetypes)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
}
