-- init.lua
-- 设置 leader
vim.g.mapleader = " "

-- 加载模块
require("options")
require("keymaps")
require("plugins")
require("lsp")
require("dap")
require("ui")
