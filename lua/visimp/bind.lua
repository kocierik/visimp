local M = {
  -- Array for exported functions which are mapped to a key
  fn = {},
  fns = 1
}

--- Checks if a bind object is correct
-- @param bind The bind object
-- @return True if the bind is _valid_, false otherwhise
function M.is_valid(bind)
  return bind ~= nil and bind.mode ~= nil and bind.bind ~= nil
end

--- Maps a mapping object ({ mode, bind, opts }) to a function in lua
-- Assumes valid input data
-- @param map The mapping object
-- @param fn The call handler
function M.map(map, fn)
  local options = { noremap = false }
  if map.opts then
    options = vim.tbl_extend('force', options, opts)
  end

  -- lua function to vimscript call
  table.insert(M.fn, fn)
  cmd = '<cmd>lua require\'visimp.bind\'.fn[' .. M.fns .. ']()<CR>'
  M.fns = M.fns + 1

  vim.api.nvim_set_keymap(map.mode, map.bind, cmd, options)
end

--- Sets up the list of binds with the given list/function of handlers
-- @param binds The list of binds in a correct format
-- @param handler Either a table of bind actions of a function for manually
--                assigning a bind function to a key
function M.bind(binds, handler)
  if type(handler) ~= 'function' and type(handler) ~= 'table' then
    error('Invalid bind handler: can either be a function or a table')
  end

  for exec, key in pairs(binds) do
    if not M.is_valid(key) then
      error('Invalid key bind: \n' .. vim.inspect(key) .. ' -> ' .. vim.inspect(exec))
    end

    local hndlr = type(handler) == 'table' and handler[exec] or handler(exec)
    M.map(key, hndlr)
  end
end

return M