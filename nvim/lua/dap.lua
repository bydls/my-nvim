-- lua/dap.lua
local function safe_require(name)
  local ok, mod = pcall(require, name)
  if not ok then
    vim.notify("Plugin "..name.." not loaded", vim.log.levels.WARN)
    return nil
  end
  return mod
end

local dap   = safe_require("dap")
local dapui = safe_require("dapui")
local dapgo = safe_require("dap-go")
local dap_py = safe_require("dap-python")

if not (dap and dapui and dapgo) then return end

dapui.setup()
dapgo.setup()
if dap_py then
  dap_py.setup("python")
end

dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = "python",
  },
}
