local opt = vim.opt

-- Appearance
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.winborder = "rounded"

-- Editing
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.wrap = false

-- Navigation
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.mouse = "a"

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Windows
opt.splitright = true
opt.splitbelow = true

-- Files
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Performance
opt.updatetime = 250
opt.timeoutlen = 400

-- System clipboard
opt.clipboard = "unnamedplus"

-- Ask before discarding unsaved work
opt.confirm = true
