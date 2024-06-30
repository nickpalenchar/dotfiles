local function label(path)
  path = path:gsub(os.getenv 'HOME', '~', 1)
  return path:gsub('([a-zA-Z])[a-z0-9]+', '%1') .. 
    (path:match '[a-zA-Z]([a-z0-9]*)$' or '')
end
local api = require 'nvim-tree.api'
local nt = require 'nvim-tree'
nt.setup { renderer = { root_folder_label = label, group_empty = label } }

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = { 
    root_folder_label = label, 
    group_empty = label 
  },
  filters = {
  },
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFile<CR>')
