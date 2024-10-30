return {
  "nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = vim.tbl_extend("force", opts.mapping, {

      -- The default selection key mapping in LazyVim uses CR, which makes
      -- typing very difficult as it will inadvertently insert snippets when
      -- its not really wanted. So... the following will disable this feature,
      ["<CR>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.close() -- Close the completion menu without selecting
          fallback() -- Perform the default Enter behavior
        else
          fallback() -- Perform the default Enter behavior if menu is not visible
        end
      end, { "i", "s" }),
    })
  end,
}
