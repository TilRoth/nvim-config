return {
    { 'mfussenegger/nvim-dap',
        dependencies = { 'folke/which-key.nvim' },
        config = function()
            local dap = require('dap')

            -- Installed with `:MasonInstall codelldb`. mason prepends its bin/ to PATH,
            -- so the bare command resolves.
            dap.adapters.codelldb = {
                type = 'server',
                port = '${port}',
                executable = {
                    command = 'codelldb',
                    args = { '--port', '${port}' },
                },
            }

            dap.configurations.cpp = {
                {
                    name = 'Launch',
                    type = 'codelldb',
                    request = 'launch',
                    program = function()
                      local prog
                      vim.ui.input({ prompt = 'Path to executable: ' .. vim.fn.getcwd() .. '/'}, function(input) prog = input end)
                      return prog
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},

                    -- 💀
                    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
                    --
                    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                    --
                    -- Otherwise you might get the following error:
                    --
                    --    Error on launch: Failed to attach to the target process
                    --
                    -- But you should be aware of the implications:
                    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
                    -- runInTerminal = false,
                },
            }

            dap.configurations.c = dap.configurations.cpp

            require('which-key').add({
                { '<leader>d', group = 'Debug' },
                { '<leader>db', function() dap.toggle_breakpoint() end, desc = 'Make a breakpoint' },
                { '<leader>dB', function() dap.toggle_breakpoint(vim.fn.input('Condition: ')) end, desc = 'Conditional breakpoint' },
                { '<leader>de', function() dap.clear_breakpoints() end, desc = 'Clear all breakpoints' },
                { '<leader>do', function() dap.step_over() end, desc = 'Step over' },
                { '<leader>di', function() dap.step_into() end, desc = 'Step into' },
                { '<leader>dx', function() dap.run_to_cursor() end, desc = 'Run to cursor' },
                { '<leader>dc', function() dap.continue() end, desc = 'Launch or continue' },
                { '<leader>dk', function() dap.terminate() end, desc = 'Terminate' },
                { '<leader>dr', function() dap.restart() end, desc = 'Restart' },
            })
        end
    },
    { 'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio', 'folke/which-key.nvim' },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()

            dap.listeners.after.event_initialized['dapui_config'] = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
              dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
              dapui.close()
            end

            require('which-key').add({
                { '<leader>dw', group = 'watches' },
                { '<leader>dwa', function() dapui.elements.watches.add(vim.fn.input('Expression: ')) end, desc = 'Add watch' },
                { '<leader>dwr', function() dapui.elements.watches.remove(vim.fn.input('Index: ')) end, desc = 'Remove watch' },
            })
        end
    },
}
