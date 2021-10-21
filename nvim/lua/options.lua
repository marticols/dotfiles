local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

-- Change colorscheme using vim command
cmd('colorscheme tokyonight')

-- Disable mode info text
opt.showmode = false

--Automatically wrap text that extends beyond the screen length.
opt.wrap = true

--Share clipboard [OSX]
opt.clipboard = 'unnamed'

--Show lines number
opt.relativenumber = true
opt.rnu = true


--Display different types of white spaces.
opt.list = true
opt.listchars.tab = '› '
opt.listchars.trail = '•'
opt.listchars.extends = '#'
opt.listchars.nbsp = '.'

--Map leader to space
g.mapleader = " "

-- Hidde netrw banner
g.netrw_banner = 0

vim.api.nvim_command([[
set updatetime=100
autocmd CursorHold * if (&filetype == 'netrw' && &number == 0) | set relativenumber | endif
]])

