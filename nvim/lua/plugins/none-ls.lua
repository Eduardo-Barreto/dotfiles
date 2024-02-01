return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        null_ls.setup({
            sources = {
                formatting.prettier.with({
                    filetypes = { "html", "css", "json", "yaml", "markdown" },
                }),
                formatting.black.with({ extra_args = { "--fast" } }),
                formatting.stylua,
                formatting.clang_format,
                formatting.uncrustify.with({
                    args = { "-c", "./uncrustify.cfg" },
                    filetypes = { "h", "hpp", "c", "cpp" },
                }),
                diagnostics.flake8,
            },
        })

        vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format" })
    end,
}
