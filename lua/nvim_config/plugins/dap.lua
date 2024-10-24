-- Debug Adaptor Protocol (DAP)
return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      {'mfussenegger/nvim-dap'},
      {'nvim-neotest/nvim-nio'},
    },
    config = function ()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup({
            -- Copy of defaults with some changes
            layouts = { {
                elements = { {
                    id = "scopes",
                    size = 0.25
                  }, {
                    id = "breakpoints",
                    size = 0.25
                  }, {
                    id = "stacks",
                    size = 0.25
                  }, {
                    id = "watches",
                    size = 0.25
                  } },
                position = "left",
                size = 80 -- double the default size
              }, {
                elements = { {
                    id = "repl",
                    size = 0.5
                  }, {
                    id = "console",
                    size = 0.5
                  } },
                position = "bottom",
                size = 10
              } },
        })

        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)

        -- Automatic DAP UI toggling
        local function set_debug_binds()
          vim.keymap.set("n", "<Down>", dap.step_over)
          vim.keymap.set("n", "<Right>", dap.step_into)
          vim.keymap.set("n", "<Up>", dap.step_out)
          vim.keymap.set("n", "<Left>", dap.step_back)
        end

        local function remove_debug_binds()
          vim.keymap.del("n", "<Down>")
          vim.keymap.del("n", "<Right>")
          vim.keymap.del("n", "<Up>")
          vim.keymap.del("n", "<Left>")
        end

        dap.listeners.after.event_initialized["dapui_config"] = function()
          set_debug_binds()
          dapui.open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
          remove_debug_binds()
          dapui.close()
        end

    end
}
