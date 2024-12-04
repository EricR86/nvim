vim.g.mapleader = " "

-- Project view with netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Block moves text in and out of sections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Motions keeping cursor the same
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep pasted text preserved
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Select system clipboard register
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- selection
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- whole line

-- Unbind this garbage
vim.keymap.set("n", "Q", "<nop>")

-- Quick fix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Open terminal (always bottom right)
vim.keymap.set("n", "<leader>t", function()
    local TERM_HEIGHT = 15
    vim.cmd("botright split")
    local win_id = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_height(win_id, TERM_HEIGHT)
    vim.cmd("terminal")
    -- Fix the height so it does not get resized (local to window)
    vim.cmd("set winfixheight")
end)

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
