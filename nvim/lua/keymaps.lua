-- Open fuzzy finder
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require'telescope.builtin'.find_files()<CR>]], {noremap=true, silent=true})

-- Move across windows
vim.api.nvim_set_keymap('n', '<leader>h', [[<cmd>wincmd h<CR>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>j', [[<cmd>wincmd j<CR>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>k', [[<cmd>wincmd k<CR>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>wincmd l<CR>]], {noremap=true, silent=true})

-- Open new tab with explorer
vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>Texplore<CR>]], {noremap=true, silent=true})
-- Open new vertical tab with explorer
vim.api.nvim_set_keymap('n', '<leader>v', [[<cmd>Vexplore<CR>]], {noremap=true, silent=true})
-- Close file
vim.api.nvim_set_keymap('n', '<leader>q', [[<cmd>q<CR>]], {noremap=true, silent=true})

-- Show lsp docs
vim.api.nvim_set_keymap('n', '<silent>K', [[<cmd>lua require'lspsaga.provider'.hover_doc()<CR>]], {noremap=true, silent=true})
-- Show lsp diagnostics
vim.api.nvim_set_keymap('n', '<silent>D', [[<cmd>lua require'lspsaga.provider.show_line_diagnostics()<CR>]], {noremap=true, silent=true})
