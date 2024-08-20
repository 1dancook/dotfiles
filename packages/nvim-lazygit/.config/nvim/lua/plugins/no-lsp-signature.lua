-- this will disable noice from displaying the lsp signature help
-- when in insert mode

return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts.lsp.signature = {
      auto_open = { enabled = false },
    }
  end,
}
