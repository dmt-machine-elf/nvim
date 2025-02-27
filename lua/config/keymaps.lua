-- switch tabs
vim.api.nvim_set_keymap("n", "<S-h>", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-l>", ":BufferNext<CR>", { noremap = true, silent = true })

-- move tabs
vim.api.nvim_set_keymap("n", "<A-h>", ":BufferMovePrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-l>", ":BufferMoveNext<CR>", { noremap = true, silent = true })
