# Neovim Configuration Workflows

Complete guide to common workflows and best practices for using this Neovim configuration.

---

## Table of Contents

1. [Daily Development Workflow](#daily-development-workflow)
2. [Working with Claude Code AI](#working-with-claude-code-ai)
3. [Git Workflow](#git-workflow)
4. [File Navigation Workflow](#file-navigation-workflow)
5. [Code Editing Workflow](#code-editing-workflow)
6. [LSP and Code Intelligence](#lsp-and-code-intelligence)
7. [Debugging Workflow](#debugging-workflow)
8. [Project Setup Workflow](#project-setup-workflow)

---

## Daily Development Workflow

### Starting Your Day

1. **Open Neovim in your project:**
   ```bash
   cd ~/projects/my-project
   nvim
   ```

2. **Session Restored Automatically:**
   - Auto-session restores your previous session
   - All buffers and windows are restored
   - You're right where you left off

3. **Quick File Access:**
   - `<leader>ff` → Find files with Telescope
   - `<leader>a` → Add files to Harpoon for quick access
   - `<C-t>`, `<C-b>`, `<C-n>`, `<C-s>` → Jump to Harpoon files

### During Development

**Common Pattern:**
```
1. <leader>ff → Find file
2. Edit code
3. <leader>gs → Check Git status
4. <leader>fp → Format with Prettier
5. <leader>cc → Ask Claude for help if needed
6. Save and continue
```

---

## Working with Claude Code AI

### Starting a New Feature with Claude

1. **Open Claude Code:**
   ```
   <Space>cc
   ```

2. **Add Context:**
   - `<leader>ab` → Add current buffer to context
   - Select code → `<leader>as` → Send selection to Claude

3. **Ask Claude:**
   - Type your question or request
   - Press `Enter` to send

4. **Review Response:**
   - `<leader>ke` → Go to end (see latest response)
   - `<leader>kb` → Scroll up to read
   - `<leader>kf` → Scroll down

5. **Work with Suggestions:**
   - Claude proposes changes
   - Review in diff view
   - `<leader>aa` → Accept or `<leader>ad` → Deny
   - Edit before accepting if needed

6. **Switch Between Code and Claude:**
   - `<leader>cC` → Go to Claude
   - `<leader>cq` → Back to code
   - Keep both open and switch as needed

### Accessing Previous Conversations

1. **View History:**
   ```
   <Space>ar  or  <Space>ch
   ```

2. **Select Conversation:**
   - Use arrow keys to navigate
   - Press `Enter` to resume

3. **Continue Where You Left Off:**
   ```
   <Space>aC
   ```
   - Instantly resumes last conversation

### Multi-File Code Review with Claude

1. **Claude proposes multiple files:**
   ```
   <Space>cb  → List all buffers
   ```

2. **Navigate between files:**
   ```
   <Space>cn  → Next file
   <Space>cp  → Previous file
   ```

3. **Review each file:**
   - Read the proposed changes
   - Edit if needed
   - `<Space>aa` → Accept or `<Space>ad` → Deny

---

## Git Workflow

### Daily Git Operations

**Check Status:**
```
<Space>gs  → Git status
```

**View Changes:**
```
<leader>gp  → Preview hunk
<leader>gb  → Toggle line blame
```

**Commit Changes:**
1. `<leader>gs` → Open Git status
2. Stage files (inside Fugitive buffer)
3. `<leader>gc` → Git commit
4. Write commit message
5. Save and close

**Push/Pull:**
```
<leader>p   → Git push (from Fugitive buffer)
<leader>P   → Git pull with rebase
<leader>gt  → Git push -u origin (set upstream)
```

### Resolving Merge Conflicts

1. **Open Git Status:**
   ```
   <leader>gs
   ```

2. **View Conflicts:**
   - Navigate to conflicted files
   - Open diff view

3. **Resolve Conflicts:**
   ```
   <leader>dg2  → Get changes from buffer 2 (left)
   <leader>dg3  → Get changes from buffer 3 (right)
   <leader>dgn  → Next conflict
   <leader>dgp  → Previous conflict
   ```

4. **Stage and Commit:**
   - After resolving, stage files
   - `<leader>gc` → Commit

### Getting Git URLs

**For Current Line:**
```
<leader>gu  → Get Git URL (opens in browser)
```

**For Selected Range:**
- Select text in Visual mode
- `<leader>gu` → Get Git URL for selection

---

## File Navigation Workflow

### Finding Files Quickly

**Telescope (Most Common):**
```
<leader>ff  → Find files
<leader>fs  → Search for string (grep)
<leader>fb  → Find buffers
<leader>fh  → Find help tags
```

**File Tree:**
```
<leader>nt  → Toggle file tree
<leader>nf  → Focus file tree
```

**Harpoon (Quick Access):**
```
<leader>a   → Add current file to Harpoon
<C-e>        → Toggle Harpoon menu
<C-t>        → Jump to file 1
<C-b>        → Jump to file 2
<C-n>        → Jump to file 3
<C-s>        → Jump to file 4
```

### Recommended File Navigation Strategy

1. **Use Harpoon for frequently accessed files:**
   - Add your main files: `<leader>a`
   - Quick jump: `<C-t>`, `<C-b>`, etc.

2. **Use Telescope for everything else:**
   - `<leader>ff` → Find any file
   - `<leader>fs` → Search code

3. **Use file tree for exploration:**
   - `<leader>nt` → Browse project structure
   - Open files from tree

---

## Code Editing Workflow

### Commenting Code

**Single Line:**
```
gcc  → Toggle comment on current line
```

**Multiple Lines:**
- Select in Visual mode
- `gc` → Toggle comment

**Block Comments:**
```
gbc  → Toggle block comment
```

### Formatting Code

**Manual Format:**
```
<leader>f   → Format current buffer
```

**Visual Selection:**
- Select code
- `<leader>f` → Format selection

**Auto-Format on Save:**
- Enabled automatically (except `.tsx` files)
- Just save: `:w`

**Prettier:**
```
<leader>fp  → Format with Prettier
```

### Renaming Files

```
<Space>rn  → Rename file/buffer
```

### Indentation

```
di  → Toggle indentation lines
```

---

## LSP and Code Intelligence

### Using LSP Features

**Go to Definition:**
```
gd  → Jump to definition
```

**Hover Documentation:**
```
K   → Show hover info
```

**Find References:**
```
<leader>vrr  → Show all references
```

**Rename Symbol:**
```
<leader>vrn  → Rename symbol (refactors all occurrences)
```

**Code Actions:**
```
<leader>vca  → Show code actions (fixes, refactors, etc.)
```

**Diagnostics:**
```
<leader>vd   → Show diagnostic in float
[d           → Previous diagnostic
]d           → Next diagnostic
```

### LSP Workflow Example

**Understanding Code:**
1. `gd` → Go to definition
2. `K` → Read documentation
3. `<leader>vrr` → See where it's used
4. Navigate back: `<C-o>` (jump back)

**Fixing Issues:**
1. `]d` → Go to next error
2. `<leader>vca` → See available fixes
3. Select fix
4. Apply

---

## Debugging Workflow

### Using Search Effectively

**Search Current File:**
```
*   → Search word under cursor forward
#   → Search word under cursor backward
n   → Next result (with highlight)
N   → Previous result
<leader>l  → Clear highlights
```

**Search Across Project:**
```
<leader>fs  → Grep search
```

**Hop Navigation:**
```
<space>hs  → Hop to word (jump anywhere quickly)
```

### Reading Code

**Scroll Efficiently:**
- `e`/`j` → Move up/down (custom mappings)
- `Ctrl-u`/`Ctrl-d` → Half page
- `Ctrl-b`/`Ctrl-f` → Full page

**Navigate Large Files:**
- `gg` → Start of file
- `G` → End of file
- `%` → Match brackets
- `*` → Find word

---

## Project Setup Workflow

### Starting a New Project

1. **Create Project Directory:**
   ```bash
   mkdir my-project
   cd my-project
   ```

2. **Initialize Git:**
   ```bash
   git init
   ```

3. **Open in Neovim:**
   ```bash
   nvim .
   ```

4. **Create Initial Files:**
   - `<leader>ff` → Create new file
   - Or use file tree: `<leader>nt`

5. **Set Up LSP:**
   - Open a file of your language
   - Mason will prompt to install LSP server
   - Or manually: `:Mason`

6. **Configure Project:**
   - Add files to Harpoon: `<leader>a`
   - Set up Git: `<leader>gs`

### Working with Multiple Projects

**Session Management:**
- Auto-session saves/restores automatically
- Each directory gets its own session
- Suppressed directories: `~/`, `~/Projects`, `~/Downloads`, `/`

**Switching Projects:**
1. Close Neovim (session auto-saved)
2. Open new project directory
3. Neovim restores that project's session

---

## Advanced Workflows

### Code Review Workflow

1. **Open Git Status:**
   ```
   <leader>gs
   ```

2. **Review Changes:**
   - Navigate through modified files
   - `<leader>gp` → Preview hunks
   - `<leader>gv` → View full diff

3. **Make Changes:**
   - Edit files as needed
   - Format: `<leader>f`

4. **Stage and Commit:**
   - Stage files
   - `<leader>gc` → Commit

### Refactoring Workflow

1. **Find All Occurrences:**
   ```
   <leader>vrr  → Find references
   ```

2. **Rename Safely:**
   ```
   <leader>vrn  → Rename symbol (updates all)
   ```

3. **Review Changes:**
   - LSP shows preview
   - Accept or modify

### Multi-File Editing

1. **Open Multiple Files:**
   ```
   <leader>ff  → Open first file
   <C-v>       → Open in vertical split
   <leader>ff  → Open second file
   ```

2. **Navigate Between Windows:**
   ```
   <C-w>h/j/k/l  → Move between windows
   <C-w>w        → Cycle windows
   ```

3. **Copy Between Files:**
   - Visual select → `y` (yank)
   - Switch window → `p` (paste)

---

## Tips and Best Practices

### Keyboard Efficiency

1. **Use Leader Key Consistently:**
   - `<Space>` is your leader
   - Most commands start with `<Space>`

2. **Learn Muscle Memory:**
   - `<Space>ff` → Files
   - `<Space>gs` → Git
   - `<Space>cc` → Claude
   - `<Space>nt` → Tree

3. **Custom Navigation:**
   - `e` = up, `j` = down, `h` = left, `t` = right
   - Faster than standard vim keys

### Claude Code Best Practices

1. **Add Context Before Asking:**
   - `<leader>ab` → Add buffer
   - Select relevant code → `<leader>as`

2. **Keep Claude Open:**
   - Don't close between questions
   - Use `<leader>cC` / `<leader>cq` to switch

3. **Review Before Accepting:**
   - Always review diffs
   - Edit if needed
   - Then accept

### Git Best Practices

1. **Check Status Frequently:**
   ```
   <leader>gs  → Quick status check
   ```

2. **Preview Before Committing:**
   ```
   <leader>gp  → Preview changes
   ```

3. **Use Line Blame:**
   ```
   <leader>gb  → See who wrote what
   ```

---

## Troubleshooting Workflows

### LSP Not Working

1. **Check LSP Status:**
   ```
   :LspInfo
   ```

2. **Install Missing Servers:**
   ```
   :Mason
   ```
   - Navigate with `j`/`k`
   - Press `i` to install

3. **Restart LSP:**
   ```
   :LspRestart
   ```

### Claude Code Not Connecting

1. **Check Status:**
   ```
   :ClaudeCodeStatus
   ```

2. **Verify CLI:**
   ```bash
   claude --version
   claude doctor
   ```

3. **Restart Claude:**
   - Close terminal: `<leader>cq`
   - Reopen: `<leader>cc`

### Files Not Found

1. **Check Ripgrep:**
   ```bash
   rg --version
   ```

2. **Check Telescope:**
   - `<leader>ff` should work
   - If not, install ripgrep

---

**Happy Coding! 🚀**

For keybindings reference, see [KEYBINDINGS.md](./KEYBINDINGS.md)
