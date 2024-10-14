return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map('n', '<leader>hs', gs.stage_hunk, { desc = "git stage hunk" } )
          map('n', '<leader>hr', gs.reset_hunk, { desc = "git reset hunk" } )
          map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = "git stage hunk" } )
          map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = "git reset hunk" } )
          map('n', '<leader>hS', gs.stage_buffer, { desc = "git stage buffer" } )
          map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "git undo stage hunk" } )
          map('n', '<leader>hR', gs.reset_buffer, { desc = "git reset buffer" } )
          map('n', '<leader>hp', gs.preview_hunk, { desc = "git preview hunk" } )
          map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = "git blame line" } )
          map('n', '<leader>hd', gs.diffthis, { desc = "git diff this" } )
          map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "git diff this sorta" } )
          map('n', '<leader>htb', gs.toggle_current_line_blame, { desc = "git toggle current line blame" } )
          map('n', '<leader>htd', gs.toggle_deleted, { desc ="git toggle deleted" } )

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "git select hunk" } )
        end
      }
    end
  }
}
