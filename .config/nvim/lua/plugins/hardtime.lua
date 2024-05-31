return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    enabled = true,
    opts = {

      -- Max count defaults to just 2. Making it a little more lenient
      -- makes sense, especially if you need to traverse within a long 
      -- word
      max_count = 10,
      -- Disable hardtime filetypes (includes defaults)
      disabled_filetypes = {
        "NvimTree",
        "TelescopePrompt",
        "aerial",
        "alpha",
        "checkhealth",
        "dapui*",
        "Diffview*",
        "Dressing*",
        "help",
        "httpResult",
        "lazy",
        "Neogit*",
        "mason",
        "neotest-summary",
        "minifiles",
        "neo-tree*",
        "netrw",
        "noice",
        "notify",
        "prompt",
        "qf",
        "oil",
        "undotree",
        "Trouble",
        "lspinfo",
      }
    },
  }
}
