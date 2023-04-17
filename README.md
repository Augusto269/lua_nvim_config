# lua_nvim_config
Lua personal configuration

# Install fonts :
https://webinstall.dev/nerdfont/
## How to configure the font for each terminal
https://webinstall.dev/nerdfont/

## How to setup : 
Prerequisite: install ripgrep. https://github.com/BurntSushi/ripgrep


First create the structure directory : 
 #nvim/lua/theprimeagen/packer.lua#
Ones you have copy this packer.lua content of the repo, you can run:
:so
:PackerSync
Then when you open nvim, you will have the plugins installed.
copy all the folders in the repo to your nvim config folder.
Example:
cp -R /Users/augustogodoy/Desktop/lua/lua_nvim_config/nvim/ ~/.config/nvim/
