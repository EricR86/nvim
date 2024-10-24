  -- Python DAP configuration defaults
return {
    'mfussenegger/nvim-dap-python', -- Out of box python configuration
    ft = "python",
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
    },
    config = function ()
      -- Can specify path python installation with debugpy
      local mason_package_path = require("mason-core.package").get_install_path('debugpy')
      local path = mason_package_path .. "/debugpy/venv/bin/python"
      require('dap-python').setup(path)
    end
}
