-- Signs for git changes plugin
return {
    'lewis6991/gitsigns.nvim',

    config = function ()
      require('gitsigns').setup()
    end,
}
