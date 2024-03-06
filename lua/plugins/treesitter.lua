return { 
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "bash", "gitignore", "make" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
