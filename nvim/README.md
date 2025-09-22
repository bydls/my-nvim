# Neovim Dotfiles (Windows)

这是我的 **Windows Neovim 配置**，集成了现代 IDE 功能，支持 Go / Python / Shell 开发，包含：

- LSP 自动补全
- DAP 调试（Go + Python）
- 文件树 & 模糊搜索
- Git 集成
- 主题美化 + Nerd Font 图标
- 可直接同步到其他电脑（dotfiles）

---

## 目录结构

nvim-dotfiles/
 ├─ init.lua          # 主配置文件
 ├─ lua/
 │   ├─ options.lua   # 基础选项
 │   ├─ keymaps.lua   # 快捷键
 │   ├─ plugins.lua   # 插件列表
 │   ├─ lsp.lua       # LSP 配置
 │   ├─ dap.lua       # 调试配置
 │   └─ ui.lua        # UI 主题与图标配置
 └─ README.md

---

## 安装步骤

1. **克隆仓库到 Neovim 配置目录**
```powershell
git clone https://github.com/<你的用户名>/nvim-dotfiles.git %LOCALAPPDATA%\nvim
```

2. **安装 Nerd Font**

- 推荐 FiraCode Nerd Font
- 在 Windows Terminal / PowerShell 设置字体为 Nerd Font

3. **安装语言服务**

- Go:

```
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
:GoInstallBinaries
```

- Python:

```
pip install 'python-lsp-server[all]'
pip install debugpy
```

- Shell:

```
npm install -g bash-language-server
```

4. **第一次启动 Neovim**

```
:Lazy sync
```

lazy.nvim 会自动安装所有插件。



## 快捷键

| 功能         | 快捷键        |
| ------------ | ------------- |
| 保存         | `<leader>w`   |
| 关闭文件     | `<leader>q`   |
| 插入模式退出 | `jk`          |
| 文件树       | `<leader>e`   |
| 模糊搜索     | `<leader>f`   |
| 模糊查找内容 | `<leader>g`   |
| 设置断点     | `<leader>b`   |
| 条件断点     | `<leader>B`   |
| DAP UI 切换  | `<leader>du`  |
| DAP REPL     | `<leader>dr`  |
| 调试开始     | `F5`          |
| 单步执行     | `F10/F11/F12` |

------

## 支持的语言

- Go
- Python
- Shell (Bash)

> 可根据需要扩展 LSP 或 DAP 配置。

## 使用方法

1. 打开文件：

```
nvim main.go
```

1. 使用 LSP 和自动补全写代码
2. 设置断点，调试 Go / Python 文件
3. 使用文件树和 Telescope 快速浏览项目

------

## 迁移到新电脑

1. 安装 Neovim
2. 安装 Git、Node.js、Python、Go
3. 克隆仓库到 `%LOCALAPPDATA%\nvim`
4. 安装语言服务
5. 打开 Neovim，运行 `:Lazy sync`

即可拥有完整相同的开发环境。