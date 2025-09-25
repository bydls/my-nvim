-- lua/lsp.lua
-- ========================================
-- Neovim LSP + nvim-cmp 基础配置
-- ========================================

local lspconfig    = require("lspconfig")
local cmp          = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- =====================
-- nvim-cmp 自动补全
-- =====================
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  }),
})

local capabilities = cmp_nvim_lsp.default_capabilities()

-- =====================
-- 各语言 LSP 配置
-- =====================

-- Go
lspconfig.gopls.setup({
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

-- Shell
lspconfig.bashls.setup({
  capabilities = capabilities,
})

-- Python (使用 pyright)
lspconfig.pyright.setup({
  capabilities = capabilities,
})
