-- lazy.nvim 安装
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git","clone","--filter=blob:none",
    "git@github.com:folke/lazy.nvim.git",lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- 主题 & 图标
  { "git@github.com:folke/tokyonight.nvim.git", config = function() vim.cmd.colorscheme("tokyonight") end },
  { "git@github.com:kyazdani42/nvim-web-devicons.git" },

  -- 文件树
  { "git@github.com:nvim-tree/nvim-tree.lua.git", dependencies = { "git@github.com:kyazdani42/nvim-web-devicons.git" }, config = function()
      require("nvim-tree").setup({ renderer = { icons = { show = { file=true, folder=true, git=true } } } })
    end
  },

  -- Treesitter
  { "git@github.com:nvim-treesitter/nvim-treesitter.git", run=":TSUpdate" },

  -- LSP & 补全
  { "git@github.com:neovim/nvim-lspconfig.git" },
  { "git@github.com:hrsh7th/nvim-cmp.git", dependencies={
      "git@github.com:hrsh7th/cmp-nvim-lsp.git",
      "git@github.com:hrsh7th/cmp-buffer.git",
      "git@github.com:hrsh7th/cmp-path.git",
      "git@github.com:L3MON4D3/LuaSnip.git"
    }
  },

  -- Telescope
  { "git@github.com:nvim-telescope/telescope.nvim.git", dependencies={"git@github.com:nvim-lua/plenary.nvim.git"} },

  -- Git
  { "git@github.com:lewis6991/gitsigns.nvim.git" },

  -- Go
  { "git@github.com:ray-x/go.nvim.git", dependencies={"git@github.com:ray-x/guihua.lua.git"}, config=function() require("go").setup() end },

  -- Shell LSP
  { "git@github.com:bash-lsp/bash-language-server.git" },

  -- Python LSP
  { "git@github.com:mfussenegger/nvim-lsp-python.git" },

  -- DAP
  { "git@github.com:mfussenegger/nvim-dap.git" },
  { "git@github.com:rcarriga/nvim-dap-ui.git", dependencies={"git@github.com:mfussenegger/nvim-dap.git"} },
  { "git@github.com:leoluz/nvim-dap-go.git", dependencies={"git@github.com:mfussenegger/nvim-dap.git"} },
})
