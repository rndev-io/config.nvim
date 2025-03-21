local M = {}

local whichkey = require "which-key"

-- local function keymap(lhs, rhs, desc)
--   vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
-- end

function M.setup()
    whichkey.add({
        mode = { 'n' },
        silent = true,
        noremap = true,
        nowait = false,
        buffer = nil,
        -- Debug group
        { "<leader>d",   group = "Debug" },
        {
            "<leader>dT",
            function()
                if vim.bo.filetype == "python" then
                    require('dap-python').test_method()
                elseif vim.bo.filetype == "go" then
                    require('dap-go').debug_test()
                end
            end,
            desc = "Run closest method above cursor"
        },

        { "<leader>dR",  "<cmd>lua require'dap'.run_to_cursor()<cr>",                               desc = "Run to Cursor" },
        { "<leader>drr", "<cmd>lua require'dap'.run()<cr>",                                         desc = "Run" },
        { "<leader>dE",  "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>",        desc = "Evaluate Input" },
        { "<leader>dC",  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", desc = "Conditional Breakpoint" },
        { "<leader>dU",  "<cmd>lua require'dapui'.toggle()<cr>",                                    desc = "Toggle UI" },
        { "<leader>db",  "<cmd>lua require'dap'.step_back()<cr>",                                   desc = "Step Back" },
        { "<leader>dc",  "<cmd>lua require'dap'.continue()<cr>",                                    desc = "Continue" },
        { "<leader>dd",  "<cmd>lua require'dap'.disconnect()<cr>",                                  desc = "Disconnect" },
        { "<leader>de",  "<cmd>lua require'dapui'.eval()<cr>",                                      desc = "Evaluate" },
        { "<leader>dg",  "<cmd>lua require'dap'.session()<cr>",                                     desc = "Get Session" },
        { "<leader>dh",  "<cmd>lua require'dap.ui.widgets'.hover()<cr>",                            desc = "Hover Variables" },
        { "<leader>dS",  "<cmd>lua require'dap.ui.widgets'.scopes()<cr>",                           desc = "Scopes" },
        { "<leader>di",  "<cmd>lua require'dap'.step_into()<cr>",                                   desc = "Step Into" },
        { "<leader>do",  "<cmd>lua require'dap'.step_over()<cr>",                                   desc = "Step Over" },
        { "<leader>dp",  "<cmd>lua require'dap'.pause.toggle()<cr>",                                desc = "Pause" },
        { "<leader>dq",  "<cmd>lua require'dap'.close()<cr>",                                       desc = "Quit" },
        { "<leader>dr",  "<cmd>lua require'dap'.repl.toggle()<cr>",                                 desc = "Toggle Repl" },
        { "<leader>ds",  "<cmd>lua require'dap'.continue()<cr>",                                    desc = "Start" },
        { "<leader>dt",  "<cmd>lua require'dap'.toggle_breakpoint()<cr>",                           desc = "Toggle Breakpoint" },
        { "<leader>dx",  "<cmd>lua require'dap'.terminate()<cr>",                                   desc = "Terminate" },
        { "<leader>du",  "<cmd>lua require'dap'.step_out()<cr>",                                    desc = "Step Out" },
    })


    whichkey.add({
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
        -- Debug group in visual mode
        {
            mode = "v", -- Specify visual mode
            { "<leader>e", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate" },
        }
    })
end

return M
