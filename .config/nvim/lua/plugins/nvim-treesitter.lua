return {
  "nvim-treesitter/nvim-treesitter",
--  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "gitignore",
        "go",
        "graphql",
        "html",
        "http",
        "java",
        "javascript",
        "lua",
        "python",
        "markdown",
        "query",
        "rust",
        "scala",
        "sql",
        "svelte",
        "vim",
        "vimdoc"
      },

      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })

    -- Handle MDX files as if they are markdown
    vim.filetype.add({
      extension = {
        mdx = "mdx",
      },
    })
    vim.treesitter.language.register("markdown", "mdx")
  end
}

