local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- extended commands for barbar

-- Define a global variable to keep track of the previous buffer
_G.previous_buffer = 1

-- Create an autocommand group for buffer events
local augroup = vim.api.nvim_create_augroup('BufferSwitch', { clear = true })


-- CLOSE TAB/OPEN LAST CLOSED TAB

vim.api.nvim_set_keymap('n', '<A-w>', ':BufferClose<CR>', { noremap = true, silent = true})
-- Exact sequence as obtained
vim.api.nvim_set_keymap('n', '^[[27;6;87]', ':BufferRestore<CR>', { noremap = true, silent = true })


-- TOGGLE TO LAST ACTIVE TAB
-- Define the function to track the previous buffer
function TrackPreviousBuffer()
  local current_buffer = vim.api.nvim_get_current_buf()
  if _G.previous_buffer ~= nil and _G.previous_buffer ~= current_buffer then
    -- Update the previous buffer only if it's different from the current buffer
    _G.previous_buffer = current_buffer
  end
end

-- Set the initial value of the previous buffer
_G.previous_buffer = vim.fn.bufnr()

-- Create the autocommand
vim.api.nvim_create_autocmd('BufLeave', {
  group = augroup,
  pattern = '*',
  callback = TrackPreviousBuffer,
})

function BufferLast()
  vim.api.nvim_set_current_buf(_G.previous_buffer)
end

-- Optional: Map a key to print the previous buffer number for debugging
vim.api.nvim_set_keymap('n', '<A-Tab>', ':lua BufferLast()<CR>', { noremap = true, silent = true })

