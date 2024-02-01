return {
    "romgrk/barbar.nvim",
    config = function()
        require("barbar").setup({
            focus_on_close = "previous",
            sidebar_filetypes = {
                NvimTree = true,
                undotree = { text = "undotree" },
                Outline = { text = "symbols-outline" },
            },
        })
    end,
}
