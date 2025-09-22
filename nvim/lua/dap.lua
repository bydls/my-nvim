local dap=require("dap")
local dapui=require("dapui")
local dapgo=require("dap-go")

dapui.setup()
dapgo.setup()

dap.adapters.python={type='executable',command='python',args={'-m','debugpy.adapter'}}
dap.configurations.python={{type='python',request='launch',name="Launch file",program="${file}",pythonPath="python"}}

vim.keymap.set('n','<F5>',dap.continue)
vim.keymap.set('n','<F10>',dap.step_over)
vim.keymap.set('n','<F11>',dap.step_into)
vim.keymap.set('n','<F12>',dap.step_out)
vim.keymap.set('n','<Leader>b',dap.toggle_breakpoint)
vim.keymap.set('n','<Leader>B',function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n','<Leader>dr',dap.repl.open)
vim.keymap.set('n','<Leader>du',dapui.toggle)
