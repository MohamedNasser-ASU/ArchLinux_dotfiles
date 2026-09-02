
local map = vim.keymap.set

-- ============================================================
-- Normal editor-style selection
-- ============================================================

-- Shift+Arrow uses Select mode rather than Visual mode.
-- Typing replaces selected text, like VS Code.
vim.opt.selection = "exclusive"
vim.opt.selectmode = "mouse,key"
vim.opt.keymodel = "startsel,stopsel"

-- ============================================================
-- Save and quit
-- ============================================================

map("n", "<leader>w", "<cmd>write<CR>", {
  desc = "Save file",
})

map("n", "<leader>q", "<cmd>quit<CR>", {
  desc = "Quit window",
})

map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
  desc = "Clear search highlighting",
})

-- ============================================================
-- Window navigation
-- ============================================================

map("n", "<C-h>", "<C-w>h", {
  desc = "Move to left window",
})

map("n", "<C-j>", "<C-w>j", {
  desc = "Move to lower window",
})

map("n", "<C-k>", "<C-w>k", {
  desc = "Move to upper window",
})

map("n", "<C-l>", "<C-w>l", {
  desc = "Move to right window",
})

-- ============================================================
-- Native Visual-mode helpers
-- ============================================================

-- Use "x", not "v", so typing in Select mode replaces text.
map("x", "<", "<gv", {
  desc = "Indent selection left",
})

map("x", ">", ">gv", {
  desc = "Indent selection right",
})

map("x", "J", ":move '>+1<CR>gv=gv", {
  desc = "Move selected lines down",
})

map("x", "K", ":move '<-2<CR>gv=gv", {
  desc = "Move selected lines up",
})

-- ============================================================
-- Diagnostics
-- ============================================================

map("n", "[d", function()
  vim.diagnostic.jump({
    count = -1,
    float = true,
  })
end, {
  desc = "Previous diagnostic",
})

map("n", "]d", function()
  vim.diagnostic.jump({
    count = 1,
    float = true,
  })
end, {
  desc = "Next diagnostic",
})

map("n", "<leader>d", vim.diagnostic.open_float, {
  desc = "Show diagnostic",
})

-- ============================================================
-- Undo and redo
-- ============================================================

map("n", "<C-z>", "u", {
  desc = "Undo",
})

map("i", "<C-z>", "<C-o>u", {
  desc = "Undo",
})

map("s", "<C-z>", "<Esc>u", {
  desc = "Undo",
})

map("n", "<C-y>", "<C-r>", {
  desc = "Redo",
})

map("i", "<C-y>", "<C-o><C-r>", {
  desc = "Redo",
})

map("s", "<C-y>", "<Esc><C-r>", {
  desc = "Redo",
})

map("n", "<C-S-z>", "<C-r>", {
  desc = "Redo",
})

map("i", "<C-S-z>", "<C-o><C-r>", {
  desc = "Redo",
})

map("s", "<C-S-z>", "<Esc><C-r>", {
  desc = "Redo",
})

-- ============================================================
-- Delete lines
-- ============================================================

map("n", "<C-S-k>", '"_dd', {
  desc = "Delete line",
})

map("i", "<C-S-k>", '<Esc>"_ddi', {
  desc = "Delete line",
})

map("x", "<C-S-k>", "<Esc><cmd>'<,'>delete _<CR>", {
  desc = "Delete selected lines",
})

map("s", "<C-S-k>", "<Esc><cmd>'<,'>delete _<CR>", {
  desc = "Delete selected lines",
})

-- ============================================================
-- Selection
-- ============================================================

-- Shift+Arrow and Ctrl+Shift+Arrow are handled automatically by:
--
--   vim.opt.selectmode = "mouse,key"
--   vim.opt.keymodel = "startsel,stopsel"
--
-- Do not add old mappings containing "v", "vb", or "<Esc>v".
-- Those mappings force Visual mode.

-- Select all, then switch from Visual mode to Select mode.
map("n", "<C-a>", "ggVG<C-g>", {
  desc = "Select all",
})

map("i", "<C-a>", "<Esc>ggVG<C-g>", {
  desc = "Select all",
})

map("s", "<C-a>", "<Esc>ggVG<C-g>", {
  desc = "Select all",
})

-- ============================================================
-- Move lines: Alt+Up/Down
-- ============================================================

-- Move lines: Ctrl+Alt+Up/Down

map("n", "<C-A-Up>", ":move .-2<CR>==")
map("n", "<C-A-Down>", ":move .+1<CR>==")

map("i", "<C-A-Up>", "<Esc>:move .-2<CR>==gi")
map("i", "<C-A-Down>", "<Esc>:move .+1<CR>==gi")

map("x", "<C-A-Up>", ":move '<-2<CR>gv=gv")
map("x", "<C-A-Down>", ":move '>+1<CR>gv=gv")

map("s", "<C-A-Up>", "<C-g>:move '<-2<CR>gv=gv<C-g>")
map("s", "<C-A-Down>", "<C-g>:move '>+1<CR>gv=gv<C-g>")

-- ============================================================
-- Duplicate lines: Alt+Shift+Up/Down
-- ============================================================

map("n", "<A-S-Up>", ":copy .-1<CR>", {
  desc = "Duplicate line upward",
})

map("n", "<A-S-Down>", ":copy .<CR>", {
  desc = "Duplicate line downward",
})

map("i", "<A-S-Up>", "<Esc>:copy .-1<CR>A", {
  desc = "Duplicate line upward",
})

map("i", "<A-S-Down>", "<Esc>:copy .<CR>A", {
  desc = "Duplicate line downward",
})

map("x", "<A-S-Up>", ":copy '<-1<CR>gv", {
  desc = "Duplicate selection upward",
})

map("x", "<A-S-Down>", ":copy '><CR>gv", {
  desc = "Duplicate selection downward",
})

map("s", "<A-S-Up>", "<C-g>:copy '<-1<CR>gv<C-g>", {
  desc = "Duplicate selection upward",
})

map("s", "<A-S-Down>", "<C-g>:copy '><CR>gv<C-g>", {
  desc = "Duplicate selection downward",
})

-- ============================================================
-- Clipboard
-- ============================================================

-- Without a selection, copy/cut the current line.
map("n", "<C-c>", '"+yy', {
  desc = "Copy line",
})

map("n", "<C-x>", '"+dd', {
  desc = "Cut line",
})

-- Visual-mode clipboard.
map("x", "<C-c>", '"+y', {
  desc = "Copy selection",
})

map("x", "<C-x>", '"+d', {
  desc = "Cut selection",
})

map("x", "<C-v>", '"+p', {
  desc = "Replace selection with clipboard",
})

-- Select-mode clipboard.
map("s", "<C-c>", '<C-g>"+y', {
  desc = "Copy selection",
})

map("s", "<C-x>", '<C-g>"+d', {
  desc = "Cut selection",
})

map("s", "<C-v>", '<C-g>"+p', {
  desc = "Replace selection with clipboard",
})

map("n", "<C-v>", '"+p', {
  desc = "Paste",
})

map("i", "<C-v>", '<C-r>+', {
  desc = "Paste",
})

-- ============================================================
-- Search
-- ============================================================

map("n", "<C-f>", "/", {
  desc = "Find in file",
})

map("i", "<C-f>", "<Esc>/", {
  desc = "Find in file",
})

map("n", "<C-p>", function()
  require("telescope.builtin").find_files({
    hidden = true,
  })
end, {
  desc = "Quick open file",
})

map("n", "<C-S-f>", function()
  require("telescope.builtin").live_grep()
end, {
  desc = "Search project",
})

map("n", "<C-S-p>", function()
  require("telescope.builtin").commands()
end, {
  desc = "Command palette",
})

-- ============================================================
-- Sidebar
-- ============================================================

map("n", "<C-b>", "<cmd>Neotree toggle reveal<CR>", {
  desc = "Toggle sidebar",
})

-- ============================================================
-- Comments
-- ============================================================

map("n", "<C-/>", "gcc", {
  remap = true,
  desc = "Toggle comment",
})

map("x", "<C-/>", "gc", {
  remap = true,
  desc = "Toggle comment",
})

map("s", "<C-/>", "<C-g>gc", {
  remap = true,
  desc = "Toggle comment",
})

-- Some terminals send Ctrl+/ as Ctrl+_.
map("n", "<C-_>", "gcc", {
  remap = true,
  desc = "Toggle comment",
})

map("x", "<C-_>", "gc", {
  remap = true,
  desc = "Toggle comment",
})

map("s", "<C-_>", "<C-g>gc", {
  remap = true,
  desc = "Toggle comment",
})

-- ============================================================
-- LSP shortcuts
-- ============================================================

map("n", "<F2>", vim.lsp.buf.rename, {
  desc = "Rename symbol",
})

map("n", "<F12>", vim.lsp.buf.definition, {
  desc = "Go to definition",
})

map("n", "<S-F12>", function()
  require("telescope.builtin").lsp_references()
end, {
  desc = "Find references",
})

-- ============================================================
-- Navigation history
-- ============================================================

map("n", "<A-Left>", "<C-o>", {
  desc = "Navigate backward",
})

map("n", "<A-Right>", "<C-i>", {
  desc = "Navigate forward",
})

-- ============================================================
-- Open buffers
-- ============================================================

map("n", "<C-Tab>", "<cmd>bnext<CR>", {
  desc = "Next buffer",
})

map("n", "<C-S-Tab>", "<cmd>bprevious<CR>", {
  desc = "Previous buffer",
})

-- ============================================================
-- Compile and run current file with F5
-- ============================================================

local function run_current_file()
  if vim.fn.mode():match("^i") then
    vim.cmd("stopinsert")
  end

  local file = vim.fn.expand("%:p")

  if file == "" then
    vim.notify(
      "Save the file before running it",
      vim.log.levels.WARN
    )
    return
  end

  vim.cmd("write")

  local filetype = vim.bo.filetype
  local source = vim.fn.shellescape(file)
  local output = vim.fn.shellescape(vim.fn.expand("%:p:r"))
  local command

  if filetype == "c" then
    command = string.format(
      "gcc -std=c17 -Wall -Wextra -Wpedantic -g %s -o %s && %s",
      source,
      output,
      output
    )
  elseif filetype == "cpp" then
    command = string.format(
      "g++ -std=c++20 -Wall -Wextra -Wpedantic -g %s -o %s && %s",
      source,
      output,
      output
    )
  elseif filetype == "python" then
    command = "python " .. source
  else
    vim.notify(
      "F5 is not configured for filetype: " .. filetype,
      vim.log.levels.WARN
    )
    return
  end

  vim.cmd("botright 12split")
  vim.cmd("terminal " .. command)
  vim.cmd("startinsert")
end

map({ "n", "i" }, "<F5>", run_current_file, {
  desc = "Compile and run current file",
})

map("n", "<leader>t", function()
  require("telescope.builtin").colorscheme({
    enable_preview = true,
  })
end, {
  desc = "Choose colorscheme",
})

-- Indent selected block with Tab
map("s", "<Tab>", "<C-g>>gv<C-g>", {
  desc = "Indent selection",
})

-- Unindent selected block with Shift+Tab
map("s", "<S-Tab>", "<C-g><gv<C-g>", {
  desc = "Unindent selection",
})
