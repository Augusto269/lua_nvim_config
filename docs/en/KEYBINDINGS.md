# Neovim Configuration Keybindings

Complete reference guide for all keybindings in this Neovim configuration.

**Note:** `<leader>` key is set to `<Space>` (spacebar)

---

## Table of Contents

1. [General Navigation](#general-navigation)
2. [File Management](#file-management)
3. [Telescope (File Finder)](#telescope-file-finder)
4. [Nvim-Tree (File Explorer)](#nvim-tree-file-explorer)
5. [LSP (Language Server Protocol)](#lsp-language-server-protocol)
6. [Git Integration](#git-integration)
7. [Harpoon (Quick File Navigation)](#harpoon-quick-file-navigation)
8. [Claude Code (AI Assistant)](#claude-code-ai-assistant)
9. [Code Formatting](#code-formatting)
10. [Search & Navigation](#search--navigation)
11. [Text Editing](#text-editing)
12. [Window Management](#window-management)
13. [Miscellaneous](#miscellaneous)

---

## General Navigation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `e` | Normal | Move up (custom mapping, replaces `k`) |
| `h` | Normal | Move left |
| `j` | Normal | Move down |
| `t` | Normal | Move right (custom mapping, replaces `l`) |
| `u` | Normal | Undo |
| `u` | Visual | Undo in visual mode |

---

## File Management

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>fx` | Normal | Open file explorer (netrw) |
| `<leader>fp` | Normal | Format file with Prettier |

---

## Telescope (File Finder)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>ff` | Normal | Find files |
| `<leader>fs` | Normal | Search for string (grep) |
| `<leader>fb` | Normal | Find buffers |
| `<leader>fh` | Normal | Find help tags |

**Telescope Navigation:**
- `j` / `k` - Navigate up/down
- `Enter` - Open selected file
- `Esc` / `q` - Close Telescope
- `Ctrl-t` - Open in new tab
- `Ctrl-v` - Open in vertical split
- `Ctrl-x` - Open in horizontal split

---

## Nvim-Tree (File Explorer)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>nt` | Normal | Toggle file tree |
| `<leader>nf` | Normal | Focus file tree |

**Inside Nvim-Tree:**
- `<CR>` (Enter) | Normal | Open file |
| `<C-v>` | Normal | Open in vertical split |
| `<C-x>` | Normal | Open in horizontal split |
| `<C-t>` | Normal | Open in new tab |
| `<C-o>` | Normal | Close parent node |
| `D` | Normal | Move to trash |
| `s` | Normal | Run system command |
| `W` | Normal | Collapse all |
| `g?` | Normal | Toggle help |

---

## LSP (Language Server Protocol)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `gd` | Normal | Go to definition |
| `K` | Normal | Show hover documentation |
| `<leader>vws` | Normal | Workspace symbol search |
| `<leader>vd` | Normal | Show diagnostic in float |
| `[d` | Normal | Go to previous diagnostic |
| `]d` | Normal | Go to next diagnostic |
| `<leader>vca` | Normal | Code actions |
| `<leader>vrr` | Normal | Show references |
| `<leader>vrn` | Normal | Rename symbol |
| `<C-h>` | Insert | Signature help |

---

## Git Integration

### Fugitive (Git Commands)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>gs` | Normal | Open Git status |
| `<leader>gu` | Normal | Git blame and browse |

**Inside Fugitive Buffer:**
| `<leader>p` | Normal | Git push |
| `<leader>P` | Normal | Git pull (with rebase) |
| `<leader>gc` | Normal | Git commit |
| `<leader>gt` | Normal | Git push -u origin (with branch selection) |
| `<leader>gv` | Normal | Git diff file |

**Diff Navigation:**
| `<leader>dg2` | Normal | Get changes from buffer 2 (left) |
| `<leader>dg3` | Normal | Get changes from buffer 3 (right) |
| `<leader>dgn` | Normal | Next diff hunk |
| `<leader>dgp` | Normal | Previous diff hunk |

### GitLinker

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>gu` | Normal | Get Git URL for current line |
| `<leader>gu` | Visual | Get Git URL for selected range |

### Gitsigns

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>gp` | Normal | Preview hunk |
| `<leader>gb` | Normal | Toggle current line blame |

---

## Harpoon (Quick File Navigation)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>a` | Normal | Add file to harpoon |
| `<C-e>` | Normal | Toggle harpoon quick menu |
| `<C-t>` | Normal | Navigate to file 1 |
| `<C-b>` | Normal | Navigate to file 2 |
| `<C-n>` | Normal | Navigate to file 3 |
| `<C-s>` | Normal | Navigate to file 4 |

---

## Claude Code (AI Assistant)

### Opening and Switching

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>cc` | Normal | Open/Focus Claude Code terminal |
| `<leader>cC` | Normal | Switch from code to Claude terminal (when Claude is open) |
| `<leader>cq` | Terminal | Switch from Claude terminal to code window (keeps Claude open) |

### Conversation Management

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>aC` | Normal | Continue last Claude conversation |
| `<leader>ar` | Normal | Resume Claude (pick from history) |
| `<leader>ch` | Normal | Open Claude history picker |
| `<leader>cv` | Normal | Claude Code verbose mode |

### Sending Context to Claude

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>as` | Visual | Send visual selection to Claude |
| `<leader>ab` | Normal | Add current buffer to Claude context |

### Diff Management

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>aa` | Normal | Accept diff changes (saves file) |
| `<leader>ad` | Normal | Deny diff changes (closes without saving) |

### Buffer Navigation (When Claude Shows Multiple Files)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>cn` | Normal | Next buffer (Claude diff) |
| `<leader>cp` | Normal | Previous buffer (Claude diff) |
| `<leader>cb` | Normal | List all buffers with Telescope |

### Navigation Inside Claude Terminal

**Chat Navigation:**
| `<leader>ku` | Terminal | Scroll up (line by line) |
| `<leader>kd` | Terminal | Scroll down (line by line) |
| `<leader>kb` | Terminal | Scroll page up (full page) |
| `<leader>kf` | Terminal | Scroll page down (full page) |
| `<leader>kh` | Terminal | Go to start of chat |
| `<leader>ke` | Terminal | Go to end of chat |
| `<leader>ki` | Terminal | Return to insert mode (to type) |

**Alternative Navigation (Standard Neovim):**
- First exit terminal mode: `<Ctrl-\><Ctrl-n>`
- Then use: `j`/`k` (line), `Ctrl-u`/`Ctrl-d` (half page), `Ctrl-b`/`Ctrl-f` (full page), `gg`/`G` (start/end)
- Search: `/` (forward), `?` (backward), `n`/`N` (next/previous)

### Workflow Examples

**Starting a New Conversation:**
1. `<leader>cc` → Open Claude Code
2. Type your question/prompt
3. Press `Enter` to send

**Accessing Old Conversations:**
1. `<leader>ar` or `<leader>ch` → Open history picker
2. Select conversation with arrow keys
3. Press `Enter` to resume

**Working with Code and Claude:**
1. `<leader>cc` → Open Claude
2. Work in code window
3. `<leader>cC` → Switch to Claude
4. `<leader>cq` → Switch back to code
5. Repeat as needed

**Reviewing Claude's Response:**
1. `<leader>ke` → Go to end (see latest response)
2. `<leader>kb` → Scroll up to read
3. `<leader>kf` → Scroll down to read more
4. `<leader>ki` → Return to insert mode to reply

**Handling Multiple File Suggestions:**
1. Claude proposes multiple files
2. `<leader>cb` → List all buffers
3. Select file with `Enter`
4. Review changes
5. `<leader>aa` → Accept or `<leader>ad` → Deny
6. `<leader>cn` → Next file
7. Repeat for each file

---

## Code Formatting

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<Leader>f` | Normal | Format current buffer |
| `<Leader>f` | Visual | Format selected range |

**Note:** Formatting also happens automatically on save (except for TypeScript React files).

---

## Search & Navigation

### Hlslens (Search Highlighting)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `n` | Normal | Next search result (with highlight) |
| `N` | Normal | Previous search result (with highlight) |
| `*` | Normal | Search word under cursor forward |
| `#` | Normal | Search word under cursor backward |
| `g*` | Normal | Search word under cursor (partial) forward |
| `g#` | Normal | Search word under cursor (partial) backward |
| `<leader>l` | Normal | Clear search highlights |

### Hop (Easy Motion)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<space>hs` | Normal/Visual | Hop to word |

---

## Text Editing

### Commenting

| Keybinding | Mode | Description |
|------------|------|-------------|
| `gcc` | Normal | Toggle comment for current line |
| `gc` | Visual | Toggle comment for selection |
| `gbc` | Normal | Toggle comment for block |

### Indentation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `di` | Normal | Toggle indentation lines (indent-blankline) |

### Renaming

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<Space>rn` | Normal | Rename file/buffer |

---

## Window Management

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-w>h` | Normal | Move to left window |
| `<C-w>j` | Normal | Move to bottom window |
| `<C-w>k` | Normal | Move to top window |
| `<C-w>l` | Normal | Move to right window |
| `<C-w>v` | Normal | Split window vertically |
| `<C-w>s` | Normal | Split window horizontally |
| `<C-w>q` | Normal | Close window |
| `<C-w>o` | Normal | Close all other windows |

---

## Miscellaneous

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>fx` | Normal | Open file explorer |
| `:GitLog` | Command | Open Git log in split terminal |

---

## Custom Commands

### GitLog

Opens Git log in a split terminal window:

```vim
:GitLog
```

---

## Configuration Details

### Leader Key

The leader key is set to `<Space>` (spacebar) in `lua/augustog/remap.lua`:

```lua
vim.g.mapleader = " "
```

### Custom Navigation Mappings

The configuration uses custom navigation mappings:
- `e` = `k` (up)
- `h` = `h` (left)
- `j` = `j` (down)
- `t` = `l` (right)

These are defined in `lua/augustog/init.lua`.

---

## Plugin-Specific Notes

### Auto-Session

Sessions are automatically saved and restored. Suppressed directories:
- `~/`
- `~/Projects`
- `~/Downloads`
- `/`

### Codeium

- Virtual text suggestions enabled
- CMP source disabled (virtual text only)
- Accept: `<Tab>`
- Next: `<M-]>`
- Previous: `<M-[>`

### Prettier

- Auto-format on save (except `.tsx` files)
- Manual format: `<leader>fp`

---

## Tips

1. **Remember:** `<leader>` = `<Space>`
2. **Use Telescope** (`<leader>ff`) for quick file navigation
3. **Use Harpoon** (`<leader>a`) to mark frequently used files
4. **LSP features** work automatically when language servers are installed
5. **Git integration** is extensive - explore Fugitive with `<leader>gs`
6. **Claude Code** provides AI assistance - use `<leader>cc` to start

---

**Happy Coding! 🚀**
