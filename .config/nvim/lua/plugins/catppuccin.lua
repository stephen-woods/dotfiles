return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        which_key = false,
        dap = {
          enabled = false,
          enable_ui = false,
        }
      },
      highlight_overrides = {
        all = function(color)
          return {
            LineNr = { fg = color.flamingo },
            SpellBad = { style = { "undercurl" }, sp = color.red, },
            SpellCap = { style = { "undercurl"}, sp = color.red, },
            SpellLocal = { style = { "undercurl" }, sp = color.red, },
            SpellRare = { style = { "undercurl" }, sp = color.red, },
          }
        end,
      },
    },
    init = function()
      vim.o.termguicolors = true
      vim.cmd [[colorscheme catppuccin]]
    end
  },
}
