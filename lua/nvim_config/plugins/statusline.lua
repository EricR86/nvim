-- Statusline
return {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup {
        options = { theme = 'gruvbox' }
      }
      vim.o.showmode = false
    end
}
