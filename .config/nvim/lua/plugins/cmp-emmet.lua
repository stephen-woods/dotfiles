-- ~/.config/nvim/lua/plugins/cmp-emmet.lua
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "dcampos/cmp-emmet-vim" },
  },
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
      { name = "emmet_vim" },
    }))
  end,
}
