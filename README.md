## README

### Initial steps
- Create SSH Key
- Clone repo from github
- Run install script
- Pull in latest changes from chezmoi fodler
- Run `<Prefix>+I` for tmux
- Run python library requirements: `pip3 install -r pip3_requirements.txt`
- Install Rust
- Dev package installs (OS related):
  - `squashfs-tools`
  - `openssl-devel`
- Set up vim by performing `:PlugInstall`
- (TODO:) Git hooks
- For C++ projects:
  - Set up compile commands - `compile_commands.json`
  - Copy .ccls file as we are using coc-lsp
  - You can copy from .clangd into .ccls, make sure you update the formats.
- Web browser:
  - Tridactyl
