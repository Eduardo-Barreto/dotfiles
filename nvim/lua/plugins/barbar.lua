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
            sort = {
                ignore_case = true
            },
            animation = true,
            tabpages = true
        })
    end,
}
