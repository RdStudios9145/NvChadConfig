require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nmap = vim.keymap.del

map({ "n", "v" }, ";",  ":",  { desc = "CMD enter command mode" })
map({ "n", "v" }, "q;", "q:", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>")
map("n", "<leader>dus", function()
  local widgets = require("dap.ui.widgets")
  widgets.sidebar(widgets.scopes).open()
end, { desc = "Open Debugging window" })

nmap("n", "<C-n>")

map("n", "<leader>fs", "<cmd> NvimTreeToggle <cr>", { desc = "Open filetree" })
