local L = require('visimp.layer').new_layer('dart')
local layers = require('visimp.loader')

L.default_config = {
  -- Uses systems' `dartls` by default, but can be disabled by setting to false
  lsp = nil,
  -- Optional configuration to be provided for the chosen language server
  lspconfig = nil
}

function L.dependencies()
  local deps = {'treesitter'}
  if L.config.lsp ~= false then
    table.insert(deps, 'lsp')
  end
  return deps
end

function L.preload()
  -- Configure treesitter
  layers.get('treesitter').langs({'dart'})

  -- Enable the language server
  if L.config.lsp ~= false then
    layers.get('lsp').use_server('dart', false, 'dartls', L.config.lspconfig)
  end
end

return L