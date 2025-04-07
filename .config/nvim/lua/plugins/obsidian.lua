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
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>gnd", ":ObsidianToday<cr>", desc = "obsidian [d]aily" },
    -- Creating tomorrows note screws up the current template, so just disable this binding for now
    --{ '<leader>nt', ':ObsidianToday 1<cr>', desc = 'obsidian [t]omorrow' },
    { "<leader>gny", ":ObsidianToday -1<cr>", desc = "obsidian [y]esterday" },
    { "<leader>gnb", ":ObsidianBacklinks<cr>", desc = "obsidian [b]acklinks" },
    { "<leader>gnl", ":ObsidianLink<cr>", desc = "obsidian [l]ink selection" },
    { "<leader>gnf", ":ObsidianFollowLink<cr>", desc = "obsidian [f]ollow link" },
    { "<leader>gnn", ":ObsidianNew<cr>", desc = "obsidian [n]ew" },
    { "<leader>gns", ":ObsidianSearch<cr>", desc = "obsidian [s]earch" },
    { "<leader>gno", ":ObsidianQuickSwitch<cr>", desc = "obsidian [o]pen quickswitch" },
    { "<leader>gnO", ":ObsidianOpen<cr>", desc = "obsidian [O]pen in app" },
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
