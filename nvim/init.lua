vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.x',
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  {
    'charludo/projectmgr.nvim',
    lazy = false,
  },

  { import = "plugins" },
}, lazy_config)

-- plugin manager (vim.plug)
vim.cmd('source ' .. os.getenv("HOME") .. '/.config/nvim/plug.vim')

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

---- project manager keymap ----
-- https://github.com/charludo/projectmgr.nvim
vim.api.nvim_set_keymap("n", "<leader>p", ":ProjectMgr<CR>", {})


vim.schedule(function()
  require "mappings"
end)
