-- lua/keymaps.lua
-- ========================================
-- 常用快捷键
-- ========================================
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = "保存文件" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = "退出" })
vim.keymap.set('i', 'jk', '<Esc>', { desc = "插入模式快速退出" })

-- ========================================
-- 文件树 & Telescope
-- ========================================
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = "切换文件树" })
vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', { desc = "文件搜索" })
vim.keymap.set('n', '<leader>g', ':Telescope live_grep<CR>', { desc = "全文搜索" })

-- ========================================
-- LSP 常用快捷键
-- ========================================
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "跳转到定义" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "查找引用" })
vim.keymap.set('n', 'K',  vim.lsp.buf.hover,      { desc = "悬停文档" })

-- ========================================
-- DAP 调试快捷键（延迟 require）
-- ========================================
local function map(lhs, rhs, desc)
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end

map('<F5>',  function() local ok, dap = pcall(require,'dap'); if ok then dap.continue() end end,        "开始/继续调试")
map('<F10>', function() local ok, dap = pcall(require,'dap'); if ok then dap.step_over() end end,       "Step Over")
map('<F11>', function() local ok, dap = pcall(require,'dap'); if ok then dap.step_into() end end,       "Step Into")
map('<F12>', function() local ok, dap = pcall(require,'dap'); if ok then dap.step_out() end end,        "Step Out")
map('<leader>b', function() local ok, dap = pcall(require,'dap'); if ok then dap.toggle_breakpoint() end end, "切换断点")
map('<leader>B', function() local ok, dap = pcall(require,'dap'); if ok then dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end end, "条件断点")
map('<leader>dr', function() local ok, dap = pcall(require,'dap'); if ok then dap.repl.open() end end,  "打开 REPL")
map('<leader>du', function() local ok, dapui = pcall(require,'dapui'); if ok then dapui.toggle() end end, "切换调试 UI")
