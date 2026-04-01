return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { 'saghen/blink.cmp' },

  -- example calling setup directly for each LSP
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local lspconfig = require('lspconfig')

    lspconfig['lua_ls'].setup({ capabilities = capabilities })
    vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)
    lspconfig['texlab'].setup {}
    lspconfig['marksman'].setup {}
    lspconfig['matlab-language-server'].setup {}
  end
}
