-- Git plugin
return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git,
      { desc = "Open Fugutive Git Buffer" });
  end
}
