-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local g = vim.g			    -- Set local "g" to vim.g.
local map = vim.keymap.set	-- Shorten function name

-----------------------------------------------------------
-- Modes
-----------------------------------------------------------
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------
-- Leader.
g.mapleader = " "           -- Set <leader> to be <Space>.
g.maplocalleader = ","		-- Set <Localleader> to be "," (comma)
g.mapsubleader = ";"		-- Map <Subleader> to be ";" (semicolon)

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", silent = true })

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically", silent = true }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally", silent = true }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size", silent = true }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split", silent = true }) -- close current split window

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab", silent = true }) -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab", silent = true }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab", silent = true }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab", silent = true }) --  go to previous tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab", silent = true }) --  move current buffer to new tab

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height", silent = true })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height", silent = true })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width", silent = true })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width", silent = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all", silent = true })
-- write file
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Write file", silent = true })

-- increment/decrement numbers
--map("n", "<leader>+", "<C-a>", { desc = "Increment number", silent = true }) -- increment
--map("n", "<leader>-", "<C-x>", { desc = "Decrement number", silent = true }) -- decrement

-- buffers
map("n", "<A-1>", vim.cmd.bfirst, { desc = "Go to first buffer", silent = true })
map("n", "<A-0>", vim.cmd.blast, { desc = "Go to last buffer", silent = true })
map("n", "<A-tab>", vim.cmd.bnext, { desc = "Go to next buffer", silent = true })
map("n", "<S-tab>", vim.cmd.bprevious, { desc = "Go to previous buffer", silent = true })

-- auto pairs
-- map("i", "(", "()<Left>", { desc = "Autoclose parenthesis", noremap = true, silent = true })
-- map("i", "[", "[]<Left>", { desc = "Autoclose square bracket", noremap = true, silent = true })
-- map("i", "{", "{}<Left>", { desc = "Autoclose curly brace", noremap = true, silent = true })
-- map("i", "'", "''<Left>", { desc = "Autoclose single quote", noremap = true, silent = true })
-- map("i", '"', '""<Left>', { desc = "Autoclose double quote", noremap = true, silent = true })

-- Escape insert mode
map("i", "jj", "<Esc>", { desc = "Exit INSERT mode", silent = true })
map("i", "jk", "<Esc>", { desc = "Exit INSERT mode", silent = true })

-- Move lines or paragraphs up and down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- Move lines or paragraphs left and right
map("v", "<", "<gv", { desc = "Indent left and reselect", silent = true })
map("v", ">", ">gv", { desc = "Indent right and reselect", silent = true })

-- Lsp
map({ "n", "v", "x" }, "<leader>lf", vim.lsp.buf.format, { desc = "Format current buffer", silent = true })
