require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
  file_ignore_patterns = { "node%modules/.*" }
}

-- Remove file from quickfix list
function RemoveQF()
    local qflist = vim.fn.getqflist()
    local current_line = vim.fn.line('.')
    if current_line >= 0 and current_line < #qflist then
        local current_buffer_name = vim.api.nvim_buf_get_name(0)
        table.remove(qflist, current_line)
        vim.fn.setqflist(qflist, 'r')
        -- Adjust cursor position
        if current_line >= #qflist then
            vim.cmd('normal! G')
        else
            vim.cmd('normal! ' .. (current_line) .. 'G')
        end
        print("Removed entry for buffer: " .. current_buffer_name)
    end
end

vim.api.nvim_create_user_command('RemoveQF', function()
    RemoveQF()
end, {})

vim.api.nvim_create_user_command('RemoveQF', function()
    RemoveQF()
end, {})

vim.api.nvim_create_augroup("QuickfixMapping", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "d", ":RemoveQF<CR>", { noremap = true, silent = true })
    end,
    group = "QuickfixMapping",
})



-- setup
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
