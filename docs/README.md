# Neovim Configuration Documentation

Welcome to the documentation for this Neovim configuration!

## Available Documentation

Documentation is organized by language:

### 🇬🇧 English Documentation

Located in [`en/`](./en/) directory:

- **[Installation Guide](./en/INSTALL_GUIDE.md)** - Complete step-by-step installation guide
- **[Keybindings Reference](./en/KEYBINDINGS.md)** - Complete reference of all keyboard shortcuts
- **[Workflows Guide](./en/WORKFLOWS.md)** - Common workflows and best practices

**Quick Links:**
- [English README](./en/README.md) - English documentation index

### 🇪🇸 Documentación en Español

Ubicada en el directorio [`es/`](./es/):

- **[Guía de Instalación](./es/GUIA_INSTALACION.md)** - Guía completa paso a paso de instalación
- **[Referencia de Atajos](./es/ATAJOS.md)** - Referencia completa de todos los atajos de teclado
- **[Guía de Flujos de Trabajo](./es/FLUJOS_TRABAJO.md)** - Flujos de trabajo comunes y mejores prácticas

**Enlaces Rápidos:**
- [README en Español](./es/README.md) - Índice de documentación en español

## Quick Start

1. **New Installation?** 
   - English: [Installation Guide](./en/INSTALL_GUIDE.md)
   - Español: [Guía de Instalación](./es/GUIA_INSTALACION.md)

2. **Need to find a shortcut?**
   - English: [Keybindings](./en/KEYBINDINGS.md)
   - Español: [Atajos](./es/ATAJOS.md)

3. **Want to learn workflows?**
   - English: [Workflows](./en/WORKFLOWS.md)
   - Español: [Flujos de Trabajo](./es/FLUJOS_TRABAJO.md)

## Configuration Structure

```
nvim/
├── init.lua                 # Main entry point
├── lua/augustog/           # Core configuration
│   ├── init.lua            # Initialization
│   ├── packer.lua          # Plugin definitions
│   ├── remap.lua           # Key mappings
│   └── set.lua             # Editor settings
├── after/plugin/           # Plugin configurations
│   ├── lsp.lua             # LSP setup
│   ├── telescope.lua        # File finder
│   ├── code-companion.lua  # Claude Code AI
│   └── ...                 # Other plugins
└── docs/                   # Documentation
    ├── README.md           # This file (main index)
    ├── en/                 # English documentation
    │   ├── README.md
    │   ├── INSTALL_GUIDE.md
    │   ├── KEYBINDINGS.md
    │   └── WORKFLOWS.md
    └── es/                 # Spanish documentation
        ├── README.md
        ├── GUIA_INSTALACION.md
        ├── ATAJOS.md
        └── FLUJOS_TRABAJO.md
```

## Features

- 🚀 **LSP Support** - Language Server Protocol for code intelligence
- 🔍 **Telescope** - Powerful file finder and search
- 🌳 **Nvim-Tree** - File explorer
- 🤖 **Claude Code** - AI coding assistant
- 📝 **Git Integration** - Full Git workflow support
- 🎨 **Prettier** - Code formatting
- 📌 **Harpoon** - Quick file navigation
- 💬 **Code Comments** - Easy commenting
- 🔎 **Enhanced Search** - Hlslens and Hop navigation

## Need Help?

- Check the troubleshooting sections in the installation guides
- Review the keybindings documentation
- Check Neovim logs with `:messages`

---

**Happy Coding! 🚀**
