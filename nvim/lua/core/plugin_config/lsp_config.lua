require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {'basedpyright'}
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
      print('setting up basedpyright')
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
}
