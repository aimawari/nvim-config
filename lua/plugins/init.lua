-- [[ Plugins ]]
vim.pack.add({
  require 'plugins.plenery',

  require 'plugins.harpoon',
  require 'plugins.which-key',
  require 'plugins.scrollbar',

  -- colorscheme
  require 'plugins.tokyonight',

  -- Mini
  require 'plugins.mini',

  -- lsp
  require 'plugins.mason',
  require 'plugins.mason-lspconfig',
  require 'plugins.lspconfig',

  -- treesitter
  require 'plugins.treesitter',

  -- formatter
  require 'plugins.conform',

  -- Flutter
  require 'plugins.debugger',
  require 'plugins.fluttertools',
}, {
  load = function(plug)
    local data = plug.spec.data or {}
    local setup = data.setup

    vim.cmd.packadd(plug.spec.name)

    if setup ~= nil and type(setup) == 'function' then setup() end
  end,
})
