-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd                    -- execute Vim commands
local exec = vim.api.nvim_exec         -- execute Vimscript
local fn = vim.fn                      -- call Vim functions
local g = vim.g                        -- global variables
local opt = vim.opt                    -- global/buffer/windows-scoped options
local api = vim.api                    -- call Vim api
local ag = vim.api.nvim_create_augroup -- create autogroup
local au = vim.api.nvim_create_autocmd -- create autocomand

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- sync with system clipboard
opt.swapfile = false          -- don't use swapfile
opt.backup = false            -- creates a backup file

--Transparent background
--cmd [[
--  highlight Normal guibg=none
--  highlight NonText guibg=none
--  highlight Normal ctermbg=none
--  highlight NonText ctermbg=none
--]]

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
--opt.guifont = "Iosevka Nerd Font Light" -- Define font for GUI version of neovim
--g.neovide_cursor_vfx_mode = "railgun"
opt.autowrite = true -- Enable auto write
opt.completeopt = "menu,menuone,noselect" -- mostly just for cmp
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true         -- Ignore case
opt.smartcase = true          -- Don't ignore case with capitals
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
opt.number = true             -- show line number
opt.relativenumber = true     -- show line number
opt.numberwidth = 4           -- set number column width to 4 {default 4}
opt.showmatch = true          -- highlight matching parenthesis
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 8 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.spell = true
opt.spelllang = { 'en_us' }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.termguicolors = true -- True color support
--opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = true -- Disable line wrap
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.linebreak = true -- companion to wrap, don't split words
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

--[[if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end]]

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

-- Change undo dir to .cache
local prefix = vim.env.XDG_CACHE_HOME or vim.fn.expand("~/.cache")
opt.undodir = { prefix .. "/nvim/undo//"}
--opt.backupdir = {prefix .. "/nvim/backup//"}
--opt.directory = { prefix .. "/nvim/swp//"}

-- netrw
cmd("let g:netrw_liststyle = 3")

-- terminal options
opt.shell = "/usr/bin/fish"
opt.shellcmdflag = "-c"

-----------------------------------------------------------
-- Folding
-----------------------------------------------------------
--opt.foldmethod = 'expr'
--opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.list = true -- Show some invisible characters (tabs...
opt.listchars = 'tab:▸ ,space:⋅,eol:↴,nbsp:␣,trail:•,precedes:«,extends:»'

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
--opt.hidden = true         -- enable background buffers
--opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
--opt.synmaxcol = 1000      -- max column for syntax highlight

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- shift 2 spaces when tab
opt.tabstop = 2             -- 1 tab == 2 spaces
opt.smartindent = true      -- Insert indents automatically

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
--cmd [[autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0]]

-----------------------------------------------------------
-- Highlight
-----------------------------------------------------------
-- highlight yanked text
au(
    "TextYankPost",
    {
        pattern = '*',
        callback = function()
            vim.highlight.on_yank { higroup='IncSearch', timeout=700 }
        end,
        group = ag('yank_highlight', {}),
    }
)

-----------------------------------------------------------
-- Spell
-----------------------------------------------------------
-- enable spanish spell on markdown
local markdown_spell = ag("markdownSpell", {})
au(
    "FileType",
    {
        pattern = "markdown",
        callback = function()
            vim.opt.spelllang = "es"
            vim.opt.spell = true
        end,
        group = markdown_spell
    }
)
au(
    {"BufRead", "BufNewFile"},
    {
        pattern = "*.md",
        callback = function()
            vim.opt.spelllang = "es"
            vim.opt.spell = true
        end,
        group = markdown_spell
    }
)
-- enable Spanish spell on latex
local latex_spell = ag("latexSpell", {})
au(
    "FileType",
    {
        pattern = "tex",
        callback = function()
            vim.opt.spelllang = "es"
            vim.opt.spell = true
    end,
    group = latex_spell
    }
)
au(
    {"BufRead", "BufNewFile"},
    {
        pattern = "*.tex",
        callback = function()
            vim.opt.spelllang = "es"
            vim.opt.spell = true
        end,
        group = latex_spell
    }
)

-----------------------------------------------------------
-- Folds
-----------------------------------------------------------
-- open files with opened folds
au(
    "BufWinEnter",
    {
        pattern = "*",
        callback = function()
            cmd([[normal zR]])
        end
    }
)
