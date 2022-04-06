-- Open fuzzy finder
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require'telescope.builtin'.git_files()<CR>]], {noremap=true, silent=true})

-- Move across windows
vim.api.nvim_set_keymap('n', '<leader>h', [[<cmd>wincmd h<CR>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>j', [[<cmd>wincmd j<CR>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>k', [[<cmd>wincmd k<CR>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>wincmd l<CR>]], {noremap=true, silent=true})

-- Open explorer
vim.api.nvim_set_keymap('n', '<leader>e', [[<cmd>Explore<CR>]], {noremap=true, silent=true})
-- Open new tab with explorer
vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>Texplore<CR>]], {noremap=true, silent=true})
-- Open new vertical tab with explorer
vim.api.nvim_set_keymap('n', '<leader>v', [[<cmd>Vexplore<CR>]], {noremap=true, silent=true})
-- Close file
vim.api.nvim_set_keymap('n', '<leader>q', [[<cmd>q<CR>]], {noremap=true, silent=true})

-- Open definition in new tab
vim.api.nvim_set_keymap('n', '<leader>d', [[<cmd>tab split | lua vim.lsp.buf.definition()<CR>]], {noremap=true, silent=true})
-- Show error in a floating window
vim.api.nvim_set_keymap('n', '<leader>D', [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], {noremap=true, silent=true})
-- Show doumentation of the object
vim.api.nvim_set_keymap('n', '<leader>H', [[<cmd>lua vim.lsp.buf.hover()<CR>]], {noremap=true, silent=true})
-- Show options to solve the error
vim.api.nvim_set_keymap('n', '<leader>a', [[<cmd>lua vim.lsp.buf.code_action()<CR>]], {noremap=true, silent=true})
-- Show references of the object
vim.api.nvim_set_keymap('n', '<leader>r', [[<cmd>lua vim.lsp.buf.references()<CR>]], {noremap=true, silent=true})
-- Rename the object
vim.api.nvim_set_keymap('n', '<leader>R', [[<cmd>lua vim.lsp.buf.rename()<CR>]], {noremap=true, silent=true})
-- Format the document
vim.api.nvim_set_keymap('n', '<leader>F', [[<cmd>lua vim.lsp.buf.formatting()<CR>]], {noremap=true, silent=true})
