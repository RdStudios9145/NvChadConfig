require "nvchad.options"

function string.starts(String, Start)
  return string.sub(String, 1, string.len(Start)) == Start
end

-- o.cursorlineopt ='both' -- to enable cursorline!

local o = vim.o

o.relativenumber = true
o.number = true

if string.starts(vim.loop.os_uname().sysname, "Windows") then
  o.shell = "bash"
else
  o.shell = "fish"
end

o.mouse = ""

vim.filetype.add({
  pattern = { [".*/hypr/.*.conf"] = "hyprlang" }
})

local paddingx = 30
local paddingy = 5

local ui = vim.api.nvim_list_uis()[1]

local width = ui.width - 2 * paddingx
local height = ui.height - 2 * paddingy

require("nvim-tree").setup({
  view = {
    -- width = width,
    -- height = height,
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        width = width,
        height = height,
        row = paddingy,
        col = paddingx,
      }
    }
  }
})
