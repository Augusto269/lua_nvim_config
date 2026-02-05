# Neovim Configuration Installation Guide

Complete installation guide for setting up this Neovim configuration on a new computer.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Install Neovim](#install-neovim)
3. [Install Required Dependencies](#install-required-dependencies)
4. [Install Fonts](#install-fonts)
5. [Clone/Copy Configuration](#clonecopy-configuration)
6. [Install Plugins](#install-plugins)
7. [Install Language Servers](#install-language-servers)
8. [Install Additional Tools](#install-additional-tools)
9. [Verify Installation](#verify-installation)
10. [Troubleshooting](#troubleshooting)

---

## Prerequisites

Before starting, ensure you have:

- **Git** installed
- **Node.js** (v16+) and **npm** installed (for some plugins and LSP servers)
- **Python 3** installed (for some LSP servers)
- **Rust** toolchain installed (if you plan to use Rust development)
- **Go** installed (if you plan to use Go development)

---

## Install Neovim

### macOS

```bash
# Using Homebrew (recommended)
brew install neovim

# Verify installation
nvim --version
```

### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install neovim

# Verify installation
nvim --version
```

### Linux (Arch)

```bash
sudo pacman -S neovim

# Verify installation
nvim --version
```

### Windows (WSL)

```bash
# In WSL
sudo apt update
sudo apt install neovim

# Verify installation
nvim --version
```

---

## Install Required Dependencies

### Ripgrep (Required for Telescope)

**macOS:**
```bash
brew install ripgrep
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install ripgrep
```

**Linux (Arch):**
```bash
sudo pacman -S ripgrep
```

### fd-find (Optional but recommended for Telescope)

**macOS:**
```bash
brew install fd
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install fd-find
```

**Linux (Arch):**
```bash
sudo pacman -S fd
```

### Git (Required)

**macOS:**
```bash
brew install git
```

**Linux:**
```bash
# Usually pre-installed, but if not:
sudo apt install git  # Ubuntu/Debian
sudo pacman -S git    # Arch
```

---

## Install Fonts

Nerd Fonts are required for proper icon support in the status bar and file tree.

### Quick Installation

Visit: [https://webinstall.dev/nerdfont/](https://webinstall.dev/nerdfont/)

### Manual Installation

1. Download a Nerd Font from: [https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)
   - Recommended: **JetBrains Mono**, **Fira Code**, or **Hack**

2. Install the font:
   - **macOS**: Double-click the `.ttf` file and click "Install Font"
   - **Linux**: Copy to `~/.local/share/fonts/` and run `fc-cache -fv`
   - **Windows**: Right-click and select "Install"

3. Configure your terminal to use the Nerd Font:
   - **iTerm2** (macOS): Preferences → Profiles → Text → Font
   - **Alacritty**: Edit config file, set `font.family`
   - **Windows Terminal**: Settings → Appearance → Font face

---

## Clone/Copy Configuration

### Option 1: Clone from Git Repository

```bash
# Clone your repository
git clone <your-repo-url> ~/.config/nvim

# Or if you already have a repo
cd ~/.config/nvim
git pull origin main
```

### Option 2: Copy from Existing Setup

```bash
# Create Neovim config directory
mkdir -p ~/.config/nvim

# Copy configuration files
cp -R /path/to/your/config/* ~/.config/nvim/
```

### Verify Structure

Your `~/.config/nvim` directory should have:
```
nvim/
├── init.lua
├── lua/
│   └── augustog/
│       ├── init.lua
│       ├── packer.lua
│       ├── remap.lua
│       └── set.lua
├── after/
│   └── plugin/
│       ├── *.lua files
└── plugin/
    └── packer_compiled.lua (will be generated)
```

---

## Install Plugins

1. **Open Neovim:**
   ```bash
   nvim
   ```

2. **Source the configuration:**
   ```vim
   :so
   ```

3. **Install plugins with Packer:**
   ```vim
   :PackerSync
   ```

   This will:
   - Install Packer.nvim plugin manager
   - Download and install all plugins defined in `packer.lua`
   - Compile the plugin configuration

4. **Wait for installation to complete** (may take several minutes)

5. **Restart Neovim:**
   ```bash
   # Exit Neovim
   :q

   # Reopen
   nvim
   ```

---

## Install Language Servers

Language servers are managed by Mason and will be installed automatically when you open a file of that type. However, you can also install them manually:

### Using Mason (Recommended)

1. Open Neovim
2. Run:
   ```vim
   :Mason
   ```
3. Navigate with `j`/`k` and press `i` to install servers
4. Install at minimum:
   - `typescript-language-server` (or `ts_ls`)
   - `rust-analyzer` (if using Rust)
   - `gopls` (if using Go)
   - `lua-language-server` (for Lua files)

### Manual Installation (Alternative)

Some servers may need manual installation:

**TypeScript Language Server:**
```bash
npm install -g typescript-language-server typescript
```

**Rust Analyzer:**
```bash
# Using rustup
rustup component add rust-analyzer
```

**Go Language Server:**
```bash
go install golang.org/x/tools/gopls@latest
```

---

## Install Additional Tools

### Prettier (Code Formatter)

Install Prettier daemon for faster formatting:

```bash
npm install -g @fsouza/prettierd
```

Or follow: [https://github.com/fsouza/prettierd](https://github.com/fsouza/prettierd)

### Claude Code CLI (For AI Code Companion)

```bash
# Install Claude Code CLI
npm install -g @anthropic-ai/claude-code

# Verify installation
claude --version

# Run doctor to check setup
claude doctor
```

### Tree-sitter (Usually auto-installed)

Tree-sitter parsers are usually installed automatically. If needed:

```vim
:TSInstall typescript javascript lua vim vue heex
```

---

## Verify Installation

### Check Neovim Version

```bash
nvim --version
# Should show Neovim 0.8.0 or higher
```

### Check Plugin Installation

```vim
:PackerStatus
```

All plugins should show as installed.

### Check LSP Servers

```vim
:LspInfo
```

Should show available language servers.

### Test Basic Functionality

1. **Open a file:**
   ```bash
   nvim test.js
   ```

2. **Test file navigation:**
   - Press `<leader>ff` (should open Telescope file finder)
   - Press `<leader>nt` (should toggle file tree)

3. **Test LSP:**
   - Type some code
   - Press `gd` (should jump to definition if LSP is working)
   - Press `K` (should show hover documentation)

---

## Troubleshooting

### Plugins Not Installing

1. **Check Packer is loaded:**
   ```vim
   :PackerStatus
   ```

2. **Reinstall Packer:**
   ```bash
   rm -rf ~/.local/share/nvim/site/pack/packer
   nvim
   :PackerSync
   ```

### LSP Not Working

1. **Check Mason:**
   ```vim
   :Mason
   ```
   Ensure language servers are installed.

2. **Check LSP status:**
   ```vim
   :LspInfo
   ```

3. **Restart LSP:**
   ```vim
   :LspRestart
   ```

### Font Icons Not Showing

1. Verify Nerd Font is installed:
   ```bash
   fc-list | grep -i "nerd\|jetbrains\|fira"
   ```

2. Configure terminal to use Nerd Font (see [Install Fonts](#install-fonts))

3. Restart terminal and Neovim

### Telescope Not Finding Files

1. **Check ripgrep is installed:**
   ```bash
   rg --version
   ```

2. **Check fd is installed (optional but recommended):**
   ```bash
   fd --version
   ```

### Claude Code Not Connecting

1. **Check Claude CLI is installed:**
   ```bash
   claude --version
   ```

2. **Check Claude Code status in Neovim:**
   ```vim
   :ClaudeCodeStatus
   ```

3. **Verify lock file exists:**
   ```bash
   ls ~/.claude/ide/
   ```

### Performance Issues

1. **Disable unused plugins** in `packer.lua`

2. **Reduce Tree-sitter parsers** if not needed

3. **Check for large files** that might slow down LSP

---

## Post-Installation Configuration

### Set Up Git (If Not Already Done)

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Configure Shell Aliases (Optional)

Add to your `~/.zshrc` or `~/.bashrc`:

```bash
alias vim="nvim"
alias vi="nvim"
```

### Set Up Auto-Session Directories

Edit `after/plugin/auto-session.lua` to configure suppressed directories if needed.

---

## Next Steps

1. **Read the Keybindings Guide:** See `KEYBINDINGS.md` for all available shortcuts
2. **Customize Configuration:** Edit files in `lua/augustog/` to customize settings
3. **Install Additional Plugins:** Add to `packer.lua` and run `:PackerSync`

---

## Support

If you encounter issues:

1. Check the [Troubleshooting](#troubleshooting) section
2. Review Neovim logs: `:messages`
3. Check plugin documentation
4. Verify all prerequisites are installed

---

**Happy Coding! 🚀**
