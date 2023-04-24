# lua_nvim_config
Lua personal configuration

# Install fonts :
https://webinstall.dev/nerdfont/
## How to configure the font for each terminal
https://webinstall.dev/nerdfont/

## Update config :
cp -R .config/nvim $GitRepo/lua_nvim_config/
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
cp -R /Users/$UserName/Desktop/$RepoConfig/lua_nvim_config/nvim/ ~/.config/nvim/
To used prettier you need to install this repo :
https://github.com/fsouza/prettierd

