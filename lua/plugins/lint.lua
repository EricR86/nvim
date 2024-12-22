-- Linting
return {
     -- Like 'ale' but doesn't try to include a LSP
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            python = {'flake8'}
        }
    end
}
