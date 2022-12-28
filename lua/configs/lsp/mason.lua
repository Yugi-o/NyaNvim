local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
  return
end

mason.setup {
  ui = {
    border = "rounded",
  },
}

local masonlsp_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not masonlsp_ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "sumneko_lua"
  },
  automatic_installation = true,
})

local opt = {
  on_attach = require("configs.lsp.handlers").on_attach,
  capabilities = require("configs.lsp.handlers").capabilities,
}

mason_lspconfig.setup_handlers {
  function (server_name) 
      require("lspconfig")[server_name].setup(opt)
  end,
  ["tsserver"] = function ()
    require("lspconfig").tsserver.setup({
      opt,
      root_dir = function (fname)
        return vim.loop.cwd()
      end
   })
  end,
}
