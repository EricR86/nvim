-- Language Server Protocol, Mason (for LSP management), and nvim-cmp (for autocompletion)
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        -- Quick setup for vim lua development
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
              library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
              },
            },
       },
    },

    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
            }
        })

        -- Setup telescope to list workspace/document symbols
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pS", builtin.lsp_dynamic_workspace_symbols, {})
        vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {})

        -- Setup appearence of diagnostic popups
        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
