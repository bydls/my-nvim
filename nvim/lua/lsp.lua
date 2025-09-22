local lspconfig = require("lspconfig")
local cmp = require("cmp")

cmp.setup({ mapping = cmp.mapping.preset.insert({["<CR>"]=cmp.mapping.confirm({select=true})}),
  sources = cmp.config.sources({ {name="nvim_lsp"}, {name="buffer"}, {name="path"} })
})

-- Go
lspconfig.gopls.setup({ capabilities=require("cmp_nvim_lsp").default_capabilities() })
-- Shell
lspconfig.bashls.setup({ capabilities=require("cmp_nvim_lsp").default_capabilities() })
-- Python
lspconfig.pylsp.setup({ capabilities=require("cmp_nvim_lsp").default_capabilities() })
