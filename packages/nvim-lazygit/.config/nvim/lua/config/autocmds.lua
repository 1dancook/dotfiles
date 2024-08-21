-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.typ",
  callback = function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    local file_name = vim.fn.fnamemodify(buf_name, ":t") -- Get the filename only
    if file_name == "main.typ" then
      vim.lsp.buf.execute_command({ command = "tinymist.pinMain", arguments = { buf_name } })
      print("Tinymist: Pinned " .. file_name)
    end
  end,
})
