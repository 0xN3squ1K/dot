return {

  "ibhagwan/fzf-lua",
  enabled = true,
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "FZF Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "FZF Grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "FZF Buffers" },
    { "<leader>fc", "<cmd>FzfLua grep_cWORD<cr>", desc = "FZF WORD under cursor" },
  },
  opts = {},

}
