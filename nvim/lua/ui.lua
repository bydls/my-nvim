-- UI 美化配置
vim.cmd.colorscheme("tokyonight")

require("nvim-tree").setup({ renderer = { icons = { show = { file=true, folder=true, git=true } } } })
