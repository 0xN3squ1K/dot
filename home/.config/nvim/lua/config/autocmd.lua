-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local ag = vim.api.nvim_create_augroup	-- create autogroup
local au = vim.api.nvim_create_autocmd	-- create autocomand

-- highlight yanked text
au('TextYankPost', {
  desc = 'Highlight yanked text',
  group = ag('yank_highlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 700,
    }
  end,
})

-- Spell
-- enable spanish spell on markdown
local markdown_spell = ag("markdownSpell", {})
au(
    "FileType",
    {
        pattern = "markdown",
        callback = function()
            vim.opt.spelllang = "es"
            --vim.opt.spell = true
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
            --vim.opt.spell = true
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
            --vim.opt.spell = true
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
            --vim.opt.spell = true
        end,
        group = latex_spell
    }
)
