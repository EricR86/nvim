-- Git plugin
return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set("n", "<leader>gs", function()
      vim.cmd("Git")
    end,
    { desc = "Open Fugutive Git Buffer" });
  end
}
