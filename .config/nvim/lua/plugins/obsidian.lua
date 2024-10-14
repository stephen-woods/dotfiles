return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/sb/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/sb/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
  },
  keys = {
    { "<leader>nd", ":ObsidianToday<cr>", desc = "obsidian [d]aily" },
    -- Creating tomorrows note screws up the current template, so just disable this binding for now
    --{ '<leader>nt', ':ObsidianToday 1<cr>', desc = 'obsidian [t]omorrow' },
    { "<leader>ny", ":ObsidianToday -1<cr>", desc = "obsidian [y]esterday" },
    { "<leader>nb", ":ObsidianBacklinks<cr>", desc = "obsidian [b]acklinks" },
    { "<leader>nl", ":ObsidianLink<cr>", desc = "obsidian [l]ink selection" },
    { "<leader>nf", ":ObsidianFollowLink<cr>", desc = "obsidian [f]ollow link" },
    { "<leader>nn", ":ObsidianNew<cr>", desc = "obsidian [n]ew" },
    { "<leader>ns", ":ObsidianSearch<cr>", desc = "obsidian [s]earch" },
    { "<leader>no", ":ObsidianQuickSwitch<cr>", desc = "obsidian [o]pen quickswitch" },
    { "<leader>nO", ":ObsidianOpen<cr>", desc = "obsidian [O]pen in app" },
  },
  opts = {
    workspaces = {
      {
        name = "sb",
        path = "~/sb",
      },
    },
    daily_notes = {
      folder = "Daily",
      date_format = "%Y/%m-%B/%Y-%m-%d-%A",
      template = "~/sb/Templates/New Daily Note.md",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    new_notes_location = "current_dir",
    templates = {
      folder = "Templates",
    },
    attachements = {
      img_folder = "Media",
      img_name_func = function()
        return string.format("%s-", os.time())
      end,
    },
  },
}
