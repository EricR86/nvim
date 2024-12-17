-- Autocommands
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local NvimConfigGroup = augroup('NvimConfigGroup', {})
local yank_group = augroup('HighlightYank', {})

-- Change terminal settings on open
-- Allow ESC to exit terminal mode in terminal buffers only
autocmd('TermOpen', {
        group = NvimConfigGroup,
        pattern = "*",
        callback = function()
            vim.opt.number = false
            vim.opt.relativenumber = false
            vim.opt.signcolumn = "no"
            vim.opt.listchars = ""

            vim.cmd.startinsert()
        end,
})

-- Bindings only set on Language Server Protocol attach
autocmd('LspAttach', {
    group = NvimConfigGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)

        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)

        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

    end
})

-- Attempt automatic linting on insert leave and save
autocmd({"InsertLeave", "BufWritePost"}, {
        group = NvimConfigGroup,
        pattern = "*",
        callback = function()
            require('lint').try_lint()
        end,
})

-- Always remove trailing whitespace on save
autocmd({"BufWritePre"}, {
    group = NvimConfigGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Highlight yanked text for a short duration
autocmd({"TextYankPost"}, {
        group = yank_group,
        pattern = "*",
        callback = function()
            vim.highlight.on_yank({higroup = "IncSearch", timeout = 100})
        end,
})
