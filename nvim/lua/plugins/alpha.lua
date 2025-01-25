return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "  Explore", ":lua vim.cmd.NvimTreeFocus()<CR>"),
            dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("s", "  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
            dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)
    end,
}
