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

require('session_manager').setup({
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir,
})
