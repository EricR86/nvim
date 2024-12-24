return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    local fzf_lua = require("fzf-lua")
    fzf_lua.setup({})

    vim.keymap.set('n', '<leader>pf', fzf_lua.git_files, {})
    vim.keymap.set('n', '<C-p>', fzf_lua.files, {})
    vim.keymap.set('n', '<leader>ps', fzf_lua.live_grep, {})
    vim.keymap.set('n', '<F1>', fzf_lua.help_tags, {})
    vim.keymap.set('n', '<C-l>', fzf_lua.resume)
  end
}
