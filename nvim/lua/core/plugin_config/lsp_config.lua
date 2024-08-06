require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'basedpyright',
    'lua_ls'
  }
})

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["basedpyright"] = function()
      require('lspconfig').basedpyright.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
          basedpyright = {
          exclude = '**/__pycache__',
          typeCheckingMode = "off",
          foo = "bar"
        }
      }
  }
  end,
  ["lua_ls"] = function()
    require('lspconfig').lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  end,
  ["pyright"] = function()
    require("lspconfig").pyright.setup({
      on_attach = function(client, bufnr)
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      end,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
        }
      }
      }
    })
  end,
  ["mypy"] = function()
    require("lspconfig").mypy.setup({
      cmd = { "mypy", "--ignore-missing-imports" },
      filetypes = { "python" },
      root_dir = require("lspconfig").util.root_pattern(".git", "mypy.ini", "setup.cfg", "pyproject.toml"),
    })
  end
}
