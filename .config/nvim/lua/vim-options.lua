-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Show relative line numbers 
vim.opt.number = true
vim.opt.relativenumber = true

-- Show line number for current line
vim.wo.number = true

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Concealed text is completely hidden unless it has custom syntax highlighting
vim.opt.conceallevel = 2

-- Enable US English spell check.
-- Use ]s will go to the next misspelled word
-- Use [s will go to the previous misspelled word
-- Use z= to open list of suggestions
-- Use zg to add word to dictionary
vim.opt.spell = true
vim.opt.spelllang = 'en_us'

-- Save undo history. Disabling for now so we don't accidentally undo too much
-- vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default. Ensure there is enough columns
vim.opt.signcolumn = 'yes:1'

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitspace in the editor
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live as you type
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Use appropriate number of spaces to insert a tab
vim.opt.expandtab = true

-- Number of spaces to use for each tab
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- vim.opt_global.completeopt = { "menuone", "noinsert", "noselect", "preview" }

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable Perl provider
vim.g.loaded_perl_provider = 0

-- Disable Python 2 provider
vim.g.loaded_python_provider = 0

-- Disable Python 3 provider
vim.g.loaded_python3_provider = 0

-- Disable Ruby provider
vim.g.loaded_ruby_provider = 0

-- Disable Node.js provider
vim.g.loaded_node_provider = 0
