-- 配色主题
vim.g.tokyonight_style = "night"
vim.cmd("colorscheme tokyonight")

-- nvim-tree 配置
require("nvim-tree").setup({
  renderer = { icons = { show = { file = true, folder = true, git = true } } }
})

-- LSP 高亮
vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultError", { fg = "#f7768e" })
vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultWarning", { fg = "#e0af68" })
vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultInformation", { fg = "#7aa2f7" })
vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultHint", { fg = "#9ece6a" })

-- DAP UI 高亮
vim.api.nvim_set_hl(0, "DapUIBreakpointsCurrentLine", { bg = "#3c3836" })
vim.api.nvim_set_hl(0, "DapUIBreakpointsLine", { fg = "#fabd2f" })
vim.api.nvim_set_hl(0, "DapUIVariable", { fg = "#b8bb26" })
vim.api.nvim_set_hl(0, "DapUIType", { fg = "#83a598" })

-- 状态栏
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ebdbb2", bg = "#3c3836" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#a89984", bg = "#282828" })

