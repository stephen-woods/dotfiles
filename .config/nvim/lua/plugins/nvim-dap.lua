return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local map = vim.keymap.set
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()


      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end


      map("n", "<F5>", function()
        dap.continue()
      end, { desc = "Debug: Start/Continue" } )

      map("n", "<F4>", function()
        dap.repl.toggle()
      end, { desc = "Debug: REPL toggle" } )

      map("n", "<leader>dK", function()
        require("dap.ui.widgets").hover()
      end, { desc = "Debug: UI Info" } )

      map("n", "<leader>b", function()
        dap.toggle_breakpoint()
      end, { desc = "Debug: [B]reakpoint toggle" } )

      map("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint conidition: ')
      end, { desc = "Debug: [B]reakpoint condition" } )

      map("n", "<F1>", function()
        dap.step_into()
      end, { desc = "Debug: step into" } )

      map("n", "<F2>", function()
        dap.step_over()
      end, { desc = "Debug: step over" } )

      map("n", "<F3>", function()
        dap.step_out()
      end, { desc = "Debug: step out" } )


      map("n", "<leader>dl", function()
        dap.run_last()
      end, { desc = "DAP run last" } )

      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
            --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }
    end
  },
}
