local servers = {
    "lua_ls",
    "arduino_language_server",
    "bashls",
    "clangd",
    "cmake",
    "html",
    "jsonls",
    "tsserver",
    "marksman",
    "ruff_lsp",
    "pyright",
    "tailwindcss",
}

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlight then
        vim.api.nvim_exec(
            [[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
            false
        )
    end
end

local function lsp_keymaps(bufnr)
    local opts = { buffer = bufnr, noremap = true }

    opts.desc = "Go to declaration"
    vim.keymap.set("n", "gD", function()
        vim.lsp.buf.declaration()
    end, opts)

    opts.desc = "Go to definition"
    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opts)

    opts.desc = "Hover LSP"
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)

    opts.desc = "Go to implementation"
    vim.keymap.set("n", "gi", function()
        vim.lsp.buf.implementation()
    end, opts)

    opts.desc = "Signature help"
    vim.keymap.set("n", "<C-k>", function()
        vim.lsp.buf.signature_help()
    end, opts)

    opts.desc = "Rename"
    vim.keymap.set("n", "<leader>rn", function()
        vim.lsp.buf.rename()
    end, opts)

    opts.desc = "See references"
    vim.keymap.set("n", "gr", function()
        require("telescope.builtin").lsp_references()
    end, opts)

    opts.desc = "Code actions"
    vim.keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
    end, opts)

    opts.desc = "Diagnostic float"
    vim.keymap.set("n", "<leader>f", function()
        vim.diagnostic.open_float()
    end, opts)

    opts.desc = "Previous diagnostic"
    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev({ border = "rounded" })
    end, opts)

    opts.desc = "Diagnostic float"
    vim.keymap.set("n", "gl", function()
        vim.diagnostic.open_float()
    end, opts)

    opts.desc = "Next diagnostic"
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next({ border = "rounded" })
    end, opts)

    opts.desc = "Set loc list diagnostic"
    vim.keymap.set("n", "<leader>q", function()
        vim.diagnostic.setloclist()
    end, opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end

local on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local capabilities = cmp_nvim_lsp.default_capabilities()
            capabilities.offsetEncoding = { "utf-8", "utf-16" }
            for _, server in pairs(servers) do
                local opts = {
                    on_attach = on_attach,
                    capabilities = cmp_nvim_lsp.default_capabilities(),
                }

                server = vim.split(server, "@")[1]

                lspconfig[server].setup(opts)
            end

            lspconfig.clangd.setup({
                on_attach = on_attach,
                capabilities = cmp_nvim_lsp.default_capabilities(),
                cmd = {
                    "clangd",
                    "--offset-encoding=utf-16",
                },
            })

            local mason_registry = require('mason-registry')
            local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
                '/node_modules/@vue/language-server'

            lspconfig.tsserver.setup {
                init_options = {
                    plugins = {
                        {
                            name = '@vue/typescript-plugin',
                            location = vue_language_server_path,
                            languages = { 'vue' },
                        },
                    },
                },
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
            }

            -- No need to set `hybridMode` to `true` as it's the default value
            lspconfig.volar.setup {}
        end,
    },
}
