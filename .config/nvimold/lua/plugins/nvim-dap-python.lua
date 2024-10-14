return {
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    -- config = function ()
    --   -- The virtual environment path of our debugpy instance
    --   local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    --   require("dap-python").setup(path)
    -- end
  },
}
