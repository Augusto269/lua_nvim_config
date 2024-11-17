# lua_nvim_config
**Lua Personal Configuration**

---

## 1. Install Fonts
Nerd Fonts are required for better icon support:  
- **Quick Installation**: [https://webinstall.dev/nerdfont/](https://webinstall.dev/nerdfont/)  
- **How to configure fonts for different terminals**: [https://webinstall.dev/nerdfont/](https://webinstall.dev/nerdfont/)

---

## 2. Prerequisites
Before proceeding, ensure the following is installed:  
- **Ripgrep**: [https://github.com/BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)  
  (This is necessary for efficient searching within `nvim`).

---

## 3. Update Configuration
To save any changes made to your Neovim configuration, copy your updated files to the repository directory. Ensure your configurations are consistently backed up.
```bash
cp -R ~/.config/nvim $GitRepo/lua_nvim_config/
```

---

## 4. Initial Setup
1. **Create the required directory structure**:  
   Make sure the file `nvim/lua/theprimeagen/packer.lua` exists.

2. **Copy content from the repository**:  
   Copy the `packer.lua` content into your Neovim configuration.
s
3. **Load and sync plugins in Neovim**:  
   Open Neovim and run the following commands:
   - `:so`  
   - `:PackerSync`

4. **Move configuration files**:  
   Copy all the folders from the repository to your Neovim configuration folder.  

---

## 5. Install Prettier
To use `prettier`, install the following repository:  
[https://github.com/fsouza/prettierd](https://github.com/fsouza/prettierd)
