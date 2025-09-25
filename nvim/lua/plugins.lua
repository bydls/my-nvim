-- lua/plugins.lua
-- ========================================
-- lazy.nvim 安装
-- ========================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "git@github.com:folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- 主题 & 图标
  { "folke/tokyonight.nvim", config = function() vim.cmd.colorscheme("tokyonight") end },
  { "kyazdani42/nvim-web-devicons" },

  -- 文件树
  { "nvim-tree/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        renderer = { icons = { show = { file=true, folder=true, git=true } } }
      })
    end
  },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

  -- LSP & 补全
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    }
  },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Go 开发
  { "ray-x/go.nvim", dependencies = { "ray-x/guihua.lua" }, config = function() require("go").setup() end },

  -- Shell LSP
  { "bash-lsp/bash-language-server" },

  -- DAP 调试
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
  { "leoluz/nvim-dap-go", dependencies = { "mfussenegger/nvim-dap" } },
  { "mfussenegger/nvim-dap-python" },  -- Python 调试
})
