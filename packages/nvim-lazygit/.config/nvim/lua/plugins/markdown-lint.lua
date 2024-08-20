-- this is here to disable the long line warning from markdownlint-cli2
-- see: https://github.com/LazyVim/LazyVim/discussions/4094
local HOME = os.getenv("HOME")
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", HOME .. "/.config/nvim/lua/plugins/markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
