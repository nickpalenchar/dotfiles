
local function set_colorscheme()
  if vim.fn.mode() == 'n' then
    vim.cmd('colorscheme lackluster')
  elseif vim.fn.mode() == 'i' then
    vim.cmd('colorscheme catppuccin-mocha')
  end
end

local augroup = vim.api.nvim_create_augroup('ToggleColorScheme', { clear = true })

vim.api.nvim_create_autocmd('ModeChanged', {
  group = augroup,
  pattern = '*',
  callback = set_colorscheme
})

