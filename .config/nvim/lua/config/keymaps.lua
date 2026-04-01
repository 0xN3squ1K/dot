-- Set local "g" to vim.g.
-- vim.g is basically a wrapper that sets globals.
-- Globals can be accessed anywhere once set.
-- SYNTAX:
-- vim.g.[global_name] = value
local g = vim.g

-- Leader.
-- Set <leader> to be <Space>.
g.mapleader = " "

-- Set <Localleader> to be "," (comma)
g.maplocalleader = ","

-- Map <Subleader> to be ";" (semicolon)
g.mapsubleader = ";"

-- Shorten function name
local map = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- buffers
map("n", "<A-1>", vim.cmd.bfirst, { desc = "Go to first buffer"})
map("n", "<A-0>", vim.cmd.blast, { desc = "Go to last buffer"})
map("n", "<A-tab>", vim.cmd.bnext, { desc = "Go to next buffer"})
map("n", "<S-tab>", vim.cmd.bprevious, { desc = "Go to previous buffer"})

-- auto pairs(LO REEMPLAZA EL PLUGIN MINI.PAIRS )
--map("i", "(", "()<Left>", { noremap = true })
--map("i", "[", "[]<Left>", { noremap = true })
--map("i", "{", "{}<Left>", { noremap = true })
--map("i", "'", "''<Left>", { noremap = true })
--map("i", '"', '""<Left>', { noremap = true })
