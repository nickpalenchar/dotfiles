require('core.keymaps')
require('core.options')
require('core.plugins')
require('core.plugin_config')

-- Function to open nvim-tree automatically
local function open_nvim_tree(data)
  -- Buffer is a [No Name] or [Command Line] or is already an nvim-tree buffer
  if vim.fn.bufname() == "" and vim.fn.win_gettype() == "" and vim.bo.filetype == "" then
    vim.cmd("NvimTreeOpen")
    vim.cmd("wincmd p")
  end
end

-- Call the function after initializing Neovim
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

