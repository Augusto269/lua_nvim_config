# Neovim Configuration

**Personal Lua Configuration for Neovim**

A comprehensive Neovim setup with LSP support, AI coding assistant (Claude Code), Git integration, and many productivity plugins.

---

## 📚 Documentation

Complete documentation is available in the [`docs/`](./docs/) directory, organized by language:

### 🇬🇧 English Documentation (`docs/en/`)
- **[Installation Guide](./docs/en/INSTALL_GUIDE.md)** - Complete step-by-step installation guide
- **[Keybindings Reference](./docs/en/KEYBINDINGS.md)** - Complete reference of all keyboard shortcuts
- **[Workflows Guide](./docs/en/WORKFLOWS.md)** - Common workflows and best practices
- [English README](./docs/en/README.md) - English documentation index

### 🇪🇸 Documentación en Español (`docs/es/`)
- **[Guía de Instalación](./docs/es/GUIA_INSTALACION.md)** - Guía completa paso a paso de instalación
- **[Referencia de Atajos](./docs/es/ATAJOS.md)** - Referencia completa de todos los atajos de teclado
- **[Guía de Flujos de Trabajo](./docs/es/FLUJOS_TRABAJO.md)** - Flujos de trabajo comunes y mejores prácticas
- [README en Español](./docs/es/README.md) - Índice de documentación en español

### Quick Links
- [Documentation Index](./docs/README.md) - Overview of all documentation

---

## 🚀 Quick Start

### For New Installations

1. **Follow the installation guide:**
   - English: [Installation Guide](./docs/en/INSTALL_GUIDE.md)
   - Español: [Guía de Instalación](./docs/es/GUIA_INSTALACION.md)

2. **Basic steps:**
   ```bash
   # Clone or copy this configuration
   cp -R /path/to/this/config ~/.config/nvim
   
   # Open Neovim
   nvim
   
   # Install plugins
   :so
   :PackerSync
   ```

### For Existing Users

1. **Update your configuration:**
   ```bash
   cp -R ~/.config/nvim /path/to/your/repo/
   ```

2. **Sync plugins:**
   ```vim
   :PackerSync
   ```

---

## ✨ Features

- 🚀 **LSP Support** - Full Language Server Protocol integration
- 🤖 **Claude Code** - AI coding assistant integration
- 🔍 **Telescope** - Powerful file finder and search
- 🌳 **Nvim-Tree** - File explorer
- 📝 **Git Integration** - Fugitive, GitLinker, and Gitsigns
- 🎨 **Prettier** - Code formatting
- 📌 **Harpoon** - Quick file navigation
- 💬 **Easy Comments** - Quick commenting
- 🔎 **Enhanced Search** - Hlslens and Hop navigation
- 🎯 **Auto-Session** - Automatic session management

---

## 📋 Prerequisites

Before installing, ensure you have:

- **Neovim** 0.8.0 or higher
- **Git** installed
- **Node.js** (v16+) and **npm** (for some plugins)
- **Ripgrep** (required for Telescope)
- **Nerd Fonts** (for icon support)

See the [Installation Guide](./docs/INSTALL_GUIDE.md) for detailed installation instructions.

---

## 🔧 Configuration Structure

```
nvim/
├── init.lua                 # Main entry point
├── lua/augustog/           # Core configuration
│   ├── init.lua            # Initialization and autocmds
│   ├── packer.lua          # Plugin definitions
│   ├── remap.lua           # Key mappings
│   └── set.lua             # Editor settings
├── after/plugin/           # Plugin configurations
│   ├── lsp.lua             # LSP setup (lsp-zero v3.x)
│   ├── telescope.lua        # File finder configuration
│   ├── code-companion.lua  # Claude Code AI assistant
│   ├── nvim-tree.lua       # File explorer
│   ├── fugitive.lua        # Git integration
│   └── ...                 # Other plugin configs
├── docs/                   # Documentation
│   ├── INSTALL_GUIDE.md    # Installation guide (EN)
│   ├── GUIA_INSTALACION.md # Installation guide (ES)
│   ├── KEYBINDINGS.md      # Keybindings reference (EN)
│   ├── ATAJOS.md          # Keybindings reference (ES)
│   └── README.md          # Documentation index
└── README.md              # This file
```

---

## ⌨️ Keybindings Quick Reference

**Leader Key:** `<Space>` (spacebar)

### Essential Shortcuts

| Shortcut | Description |
|----------|-------------|
| `<leader>ff` | Find files (Telescope) |
| `<leader>nt` | Toggle file tree |
| `<leader>cc` | Toggle Claude Code AI |
| `<leader>gs` | Git status |
| `<leader>a` | Add file to Harpoon |

**For complete keybindings, see:**
- [KEYBINDINGS.md](./docs/en/KEYBINDINGS.md) (English)
- [ATAJOS.md](./docs/es/ATAJOS.md) (Español)

---

## 📦 Main Plugins

- **lsp-zero.nvim** - LSP configuration
- **mason.nvim** - LSP server installer
- **telescope.nvim** - File finder
- **nvim-tree.lua** - File explorer
- **claudecode.nvim** - Claude Code AI integration
- **harpoon** - Quick file navigation
- **fugitive** - Git integration
- **prettier.nvim** - Code formatting
- **nvim-treesitter** - Syntax highlighting
- **auto-session** - Session management

See `lua/augustog/packer.lua` for the complete list.

---

## 🛠️ Installation of Additional Tools

### Prettier

Install Prettier daemon for faster formatting:

```bash
npm install -g @fsouza/prettierd
```

More info: [prettierd](https://github.com/fsouza/prettierd)

### Claude Code CLI

Install Claude Code CLI for AI assistance:

```bash
npm install -g @anthropic-ai/claude-code
claude doctor  # Verify installation
```

---

## 📖 Learn More

- **New to this config?** Start with the [Installation Guide](./docs/en/INSTALL_GUIDE.md) or [Guía de Instalación](./docs/es/GUIA_INSTALACION.md)
- **Need a shortcut?** Check [Keybindings](./docs/en/KEYBINDINGS.md) or [Atajos](./docs/es/ATAJOS.md)
- **Want to learn workflows?** See [Workflows](./docs/en/WORKFLOWS.md) or [Flujos de Trabajo](./docs/es/FLUJOS_TRABAJO.md)
- **Having issues?** See the troubleshooting section in the installation guides

---

## 🔄 Updating Configuration

To save changes to your repository:

```bash
cp -R ~/.config/nvim /path/to/your/repo/
```

To sync plugins after updates:

```vim
:PackerSync
```

---

## 📝 Notes

- This configuration uses **lsp-zero v3.x** branch
- **Leader key** is set to `<Space>`
- Custom navigation mappings: `e`=up, `h`=left, `j`=down, `t`=right
- Auto-formatting on save is enabled (except for `.tsx` files)

---

## 🤝 Contributing

If you improve this configuration, please document your changes and update the relevant documentation files.

---

## 📄 License

Personal configuration - feel free to use and modify as needed.

---

**Happy Coding! 🚀**

For detailed documentation, visit the [`docs/`](./docs/) directory:
- 🇬🇧 [English Documentation](./docs/en/)
- 🇪🇸 [Documentación en Español](./docs/es/)
