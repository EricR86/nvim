-- Comment toggle
return {
    "numToStr/Comment.nvim", lazy = false,
    config = function() -- NB: Could use config=true
        require("Comment").setup()
    end
}
