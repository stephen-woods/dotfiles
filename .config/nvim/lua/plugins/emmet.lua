-- ~/.config/nvim/lua/plugins/emmet.lua
return {
  "mattn/emmet-vim",
  ft = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte" },
  -- config = function()
  --   vim.g.user_emmet_leader_key = "<C-e>" -- Sets the Emmet trigger key to Ctrl+e
  -- end,
}
