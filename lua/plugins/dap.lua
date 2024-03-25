return {
    { 'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')
            -- not installed by mason
            dap.adapters.lldb = {
                type = 'executable',
                command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
                name = 'lldb'
            }

            -- installed by mason
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                  -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
                  command = "codelldb",
                  args = { "--port", "${port}" },

                  -- On windows you may have to uncomment this:
                  -- detached = false,
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
            dap.configurations.rust = dap.configurations.cpp


            local wk = require('which-key')
            wk.register({
                name = 'Debug',
                b = { function() dap.toggle_breakpoint() end, 'Make a breakpoint' },
                B = { function() dap.toggle_breakpoint(vim.fn.input('Condition: ')) end, 'Conditional breakpoint' },
                e = { function() dap.clear_breakpoints() end, 'Clear all breakpoints' },
                o = { function() dap.step_over() end, 'Step over' },
                i = { function() dap.step_into() end, 'Step into' },
                x = { function() dap.run_to_cursor() end, 'Run to cursor' },
                c = { function() dap.continue() end, 'Launch or continue' },
                k = { function() dap.terminate() end, 'Terminate' },
                r = { function() dap.restart() end, 'Restart' },
            }, { prefix = '<leader>d' })
        end
    },
    { 'rcarriga/nvim-dap-ui',
        dependencies = {'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio'},
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
              dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
              dapui.close()
            end


            local wk = require('which-key')
            wk.register({
                name = 'Debug',
                w = {
                    name = 'watches',
                    a = { function() dapui.elements.watches.add(vim.fn.input('Expression: ')) end, 'Add watch' },
                    r = { function() dapui.elements.watches.remove(vim.fn.input('Index: ')) end, 'Remove watch' },
                }
            }, { prefix = '<leader>d' })
        end
    },
    { 'ldelossa/nvim-dap-projects',
        dependencies = {'mfussenegger/nvim-dap'},
        config = function()
            require('nvim-dap-projects').search_project_config()
        end
    },
    { 'mfussenegger/nvim-dap-python',
        dependencies = {'mfussenegger/nvim-dap'},
        config = function()
            require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
        end
    },
    { 'jay-babu/mason-nvim-dap.nvim',
        dependencies = {'williamboman/mason.nvim'},
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { 'codelldb', 'debugpy' },
            })
        end
    }
}
