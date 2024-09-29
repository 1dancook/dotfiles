---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@type vim.diagnostic.Opts
      diagnostics = {
        virtual_text = false, -- Always include the diagnostic source in the message (default is "if_many")
        float = { source = true },
      },
    },
  },
}
