-- An escape hatch, mostly for fixing keymappings that plugins
-- remapped. This is the last file loaded in init.lua

local opts = { noremap = true, silent = true }

vim.defer_fn(function()
  print('set')
  vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeFocus<CR>', opts)
  -- more remaps can go here 
end, 0)
