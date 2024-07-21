-- Set leader key to space
vim.g.mapleader = ' '

-- Define a custom function to select and highlight the next match
function SelectAndHighlightNextMatch()
  -- Yank the current visual selection into the 'v' register
  vim.api.nvim_command('normal! gv"vy')
  local search_pattern = vim.fn.escape(vim.fn.getreg('v'), '/\\')

  -- Set the search register to the pattern of the visual selection
  vim.fn.setreg('/', search_pattern)
  vim.opt.hlsearch = true

  -- Use 'zv' to reveal all matches if folded
  vim.api.nvim_command('normal! zv')

  -- Move the cursor to the next match
  vim.api.nvim_command('normal! n')
  vim.api.nvim_command('normal! gv')
end

-- Map <leader>n to the custom function in visual mode
vim.api.nvim_set_keymap('x', '<leader>n', ':lua SelectAndHighlightNextMatch()<CR>', { noremap = true, silent = true })

-- Define a custom function to replace all highlighted matches with new text
function ReplaceHighlightedText(new_text)
  -- Save the current search pattern
  local search_pattern = vim.fn.getreg('/')

  -- Replace all occurrences of the search pattern with the new text
  vim.api.nvim_command('%s/' .. search_pattern .. '/' .. new_text .. '/g')

  -- Clear search highlighting
  vim.opt.hlsearch = false
end

-- Create a command to call the ReplaceHighlightedText function
vim.api.nvim_create_user_command('Sub', function(opts)
  ReplaceHighlightedText(opts.args)
end, { nargs = 1 })

-- Define a custom function to replace highlighted text directly from visual mode
function ReplaceSelectionWithText()
  vim.fn.inputsave()
  local new_text = vim.fn.input('Replace with: ')
  vim.fn.inputrestore()
  ReplaceHighlightedText(new_text)
end

-- Map <leader>r to replace the highlighted text with user input in visual mode
vim.api.nvim_set_keymap('x', '<leader>r', ':<C-u>lua ReplaceSelectionWithText()<CR>', { noremap = true, silent = true })

