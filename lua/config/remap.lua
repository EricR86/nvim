vim.g.mapleader = " "

-- Project view with file explorer (oil/netrw)
vim.keymap.set("n", "<leader>pv", ":e .<cr>",{ desc="Project file view" })

-- Block moves text in and out of section
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc="Move block of code up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc="Move block of code down" })

-- Motions keeping cursor the same
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep pasted text preserved
vim.keymap.set("x", "<leader>p", [["_dP]], { desc="Paste keeping preserved" })

-- Select system clipboard register
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to clipboard" }) -- selection
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = "Yank line to clipboard" }) -- whole line

-- Unbind this garbage
vim.keymap.set("n", "Q", "<nop>")

-- Quick fix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Execute lua code under cursor
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Execute lua under cursor" })

-- Leave terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Open terminal (always bottom right)
vim.keymap.set("n", "<leader>t", function()
    local TERM_HEIGHT = 15
    -- vim.cmd("botright split")
    -- local win_id = vim.api.nvim_get_current_win()
    -- vim.api.nvim_win_set_height(win_id, TERM_HEIGHT)
    vim.cmd.split()
    vim.cmd.term()
    -- Move the terminal to the bottom
    vim.cmd.wincmd("J")
    -- Set the height of the current window
    vim.api.nvim_win_set_height(0, TERM_HEIGHT)
    -- Fix the height so it does not get resized (local to window)
    vim.opt.winfixheight = true
end,
{ desc = "Open terminal bottom right" })

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
{ desc = "Replace current word" })
