return {

    -- nvim-dap
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            vim.keymap.set("n", "<leader>dt", function()
                dap.toggle_breakpoint()
            end)

            vim.keymap.set("n", "<leader>dc", function()
                dap.continue()
            end)

            vim.keymap.set("n", "<leader>dso", function()
                dap.step_over()
            end)

            vim.keymap.set("n", "<leader>dsi", function()
                dap.step_into()
            end)

            vim.keymap.set("n", "<leader>dsb", function()
                dap.step_out()
            end)

            vim.keymap.set({ "n", "v" }, "<leader>dh", function()
                require("dap.ui.widgets").hover()
            end)

            vim.keymap.set({ "n", "v" }, "<leader>dp", function()
                require("dap.ui.widgets").preview()
            end)

            vim.keymap.set("n", "<leader>df", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.frames)
            end)

            vim.keymap.set("n", "<leader>ds", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.scopes)
            end)
        end,
    },
    --
    -- -- nvim-dap-ui
    -- {
    -- 	"rcarriga/nvim-dap-ui",
    -- 	requires = { "mfussenegger/nvim-dap" },
    -- 	config = function()
    -- 		require("plugins.debugging.nvim-dap-ui")
    -- 	end,
    -- },
    --
    -- -- nvim-dap-virtual-text
    -- {
    -- 	"theHamsta/nvim-dap-virtual-text",
    -- 	requires = { "mfussenegger/nvim-dap" },
    -- 	config = function()
    -- 		require("plugins.debugging.nvim-dap-virtual-text")
    -- 	end,
    -- },
    --
    -- -- nvim-dap-python
    -- {
    -- 	"mfussenegger/nvim-dap-python",
    -- 	requires = { "mfussenegger/nvim-dap" },
    -- 	config = function()
    -- 		require("plugins.debugging.nvim-dap-python")
    -- 	end,
    -- },
    --
    -- -- nvim-dap-lldb
    -- {
    -- 	"rcarriga/nvim-dap-lldb",
    -- 	requires = { "mfussenegger/nvim-dap" },
    -- 	config = function()
    -- 		require("plugins.debugging.nvim-dap-lldb")
    -- 	end,
    -- },
    --
    -- -- nvim-dap-cpptools
    -- {
    -- 	"rcarriga/nvim-dap-cpptools",
    -- 	requires = { "mfussenegger/nvim-dap" },
    -- 	config = function()
    -- 		require("plugins.debugging.nvim-dap-cpptools")
    -- 	end,
    -- },
}
