local opts = { noremap = true, silent = true }

-- Set highlight on search, but clear on pressing <esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd> nohlsearch <CR>', { desc = 'Clear highlighted searcher' } )

-- Navigate vim panes better
vim.keymap.set('n', '<c-h>', ':TmuxNavigateLeft<CR>', { desc = 'Window left' })
vim.keymap.set('n', '<c-j>', ':TmuxNavigateDown<CR>', { desc = 'Window down' })
vim.keymap.set('n', '<c-k>', ':TmuxNavigateUp<CR>', { desc = 'Window up' })
vim.keymap.set('n', '<c-l>', ':TmuxNavigateRight<CR>', { desc = 'Window right'})

-- NVimTree
vim.keymap.set('n', '<c-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'NVimTree Toggle' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Remap page forard/backward to center cursor in the middle of the screen
vim.keymap.set({ 'n', 'v' }, '<C-f>', '<C-f>zz', { desc = 'Page down' })
vim.keymap.set({ 'n', 'v' }, '<C-b>', '<C-b>Hzz', { desc = 'Page up' })
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { desc = 'Half page down' })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { desc = 'Half page up' })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
vim.keymap.set({ 'n', 'v' }, 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
vim.keymap.set({ 'n', 'v' }, 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
vim.keymap.set({ 'n', 'v' }, '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = 'Down', expr = true })
vim.keymap.set({ 'n', 'v' }, '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = 'Up', expr = true })

-- vim.keymap.set('n', '<leader>n', '<cmd> set nu! <CR>', { desc = 'Toggle line numbers' })
-- vim.keymap.set('n', '<leader>rn', '<cmd> set rnu! <CR>', { desc = 'Toggle reverse line numbers' })

vim.keymap.set('n', '<leader>fdc', '<cmd> Telescope dap commands <CR>', { desc = 'Telescope dap commands'})
vim.keymap.set('n', '<leader>fdx', '<cmd> Telescope dap configurations <CR>', { desc = 'Telescope dap configurations'})
vim.keymap.set('n', '<leader>fdb', '<cmd> Telescope dap list_breakpoints <CR>', { desc = 'Telescope dap list breakpoints'})
vim.keymap.set('n', '<leader>fdv', '<cmd> Telescope dap variables <CR>', { desc = 'Telescope dap variables'})
vim.keymap.set('n', '<leader>fdf', '<cmd> Telescope dap frames <CR>', { desc = 'Telescope dap frames'})

vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)


vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
