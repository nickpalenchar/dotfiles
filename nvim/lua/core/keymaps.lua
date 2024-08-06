vim.opt.timeoutlen = 300

local map = function (from, to)
  vim.keymap.set('n', from, to, { noremap = true, silent = true })
end

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- duplicate current line
vim.api.nvim_set_keymap('n', 'yy', ':t.<CR>', { noremap = true, silent = true })

-- better jumping to/from end of line
map('0', '^')

-- insert acts like append by default
map('a', 'i')
map('i', 'a')
