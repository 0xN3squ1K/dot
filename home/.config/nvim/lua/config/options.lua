-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap		-- set global keymap
local cmd = vim.cmd							-- execute Vim commands
local exec = vim.api.nvim_exec				-- execute Vimscript
local fn = vim.fn							-- call Vim functions
local g = vim.g								-- global variables
local opt = vim.opt							-- global/buffer/windows-scoped options
local api = vim.api							-- call Vim api

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'								-- enable mouse support
opt.clipboard = 'unnamedplus'				-- sync with system clipboard
opt.swapfile = false							-- don't use swapfile
opt.shadafile = "NONE"						-- Do not save and restore the shada file
opt.updatetime = 250							-- faster completion (4000ms default)
--opt.hidden = true							-- enable background buffers
--opt.history = 100							-- remember n lines in history
--opt.lazyredraw = true						-- faster scrolling (can be omitted. It is discouraged in modern neovim configs (or considered unnecessary))
--opt.synmaxcol = 1000						-- max column for syntax highlight
opt.undofile = true							--
opt.undolevels = 10000						--
opt.backup = false							-- creates a backup file
opt.writebackup = false						-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
--opt.timeoutlen = 300						--
opt.fileencoding = "utf-8"					-- the encoding written to a file

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.autowrite = false						-- Enable auto write
opt.autoread = true							-- auto-reload changes if outside of neovim
opt.confirm = true							-- Confirm to save changes before exiting modified buffer
opt.cursorline = true						-- Enable highlighting of the current line
opt.formatoptions = "jcroqlnt"				-- tcqj
opt.grepformat = "%f:%l:%c:%m"				--
opt.grepprg = "rg --vimgrep"					--
opt.inccommand = "nosplit"					-- preview incremental substitute
opt.laststatus = 0							-- 
opt.number = true							-- show line number
opt.relativenumber = true					-- show line number
opt.numberwidth = 4							-- set number column width to 4 {default 4}
opt.showmatch = true							-- highlight matching parenthesis
opt.pumblend = 10							-- Popup blend
opt.pumheight = 10							-- Maximum number of entries in a popup
opt.scrolloff = 8							-- minimal number of screen lines to keep above and below the cursor
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
--opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false							-- Dont show mode since we have a statusline
opt.sidescrolloff = 8						-- Columns of context
opt.splitbelow = true						-- Put new windows below current
opt.splitright = true						-- Put new windows right of current
opt.termguicolors = true						-- True color support
opt.wildmode = "longest:full,full"			-- Command-line completion mode
opt.winminwidth = 5							-- Minimum window width
opt.wrap = false								-- Prevents text wrap if text extends current window
opt.linebreak = true							-- companion to wrap, don't split words
opt.ignorecase = true						-- Ignore case
opt.smartcase = true							-- Don't ignore case with capitals
opt.hlsearch = true							-- highlighting while searching
opt.incsearch = true							-- Show match for each character entered during search
opt.winborder = "rounded"					-- sets rounded 'single' borders for floating windows

-----------------------------------------------------------
-- Autocompletion, lsp
-----------------------------------------------------------
opt.completeopt = "menu,menuone,noselect"	-- mostly just for cmp
opt.signcolumn = "auto"						-- Always show the signcolumn, otherwise it would shift the text each time

-----------------------------------------------------------
-- Markup
-----------------------------------------------------------
g.markdown_recommended_style = 0				-- Fix markdown indentation settings
opt.conceallevel = 0							-- 3 = Hide * markup for bold and italic
opt.concealcursor = ""						-- do not hide cursorline in markup
-----------------------------------------------------------
-- Change undo dir to .cache
-----------------------------------------------------------
local prefix = vim.env.XDG_CACHE_HOME or vim.fn.expand("~/.cache")
opt.undodir = { prefix .. "/nvim/undo//"}
--opt.backupdir = {prefix .. "/nvim/backup//"}
--opt.directory = { prefix .. "/nvim/swp//"}

-----------------------------------------------------------
-- Terminal options
-----------------------------------------------------------
opt.shell = "/usr/bin/fish"
opt.shellcmdflag = "-c"

-----------------------------------------------------------
-- Neovim file explorer
-----------------------------------------------------------
g.netrw_liststyle = 3						-- 3 = Tree listing

-----------------------------------------------------------
-- Spell
-----------------------------------------------------------
opt.spell = true
opt.spelllang = { 'en_us' }
--opt.spelllang = { 'en_us', 'es' }         -- Bilingual

-----------------------------------------------------------
-- Folding
-----------------------------------------------------------
--opt.foldmethod = 'expr'
--opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.list = true								-- Show some invisible characters (tabs...
opt.listchars = 'tab:▸ ,space:⋅,eol:↴,nbsp:␣,trail:•,precedes:«,extends:»'

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true							-- Use spaces instead of tabs
opt.shiftwidth = 4							-- Number of spaces to use for autoindent
opt.tabstop = 4								-- 1 tab == 4 spaces
opt.smartindent = true						-- Smart autoindenting when starting a new line
opt.shiftround = true						-- Round indent to multiple of 'shiftwidth'
