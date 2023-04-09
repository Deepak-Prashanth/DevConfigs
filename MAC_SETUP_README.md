# Mac Setup instructions
1. Install xcode
`xcode-select --install`
2. Update brew and install dependencies
```
brew update-reset
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Install libtmux python:
pip install --user libtmux
# Run tmux install
>> Prefix+I
```
3. Install font for alacritty, some features outlined (here)[]
```
brew tap homebrew/cask-fonts && brew install homebrew/cask-fonts/font-fira-mono --cask
brew tap homebrew/cask-fonts && brew install homebrew/cask-fonts/font-hack--cask
brew tap homebrew/cask-fonts && brew install homebrew/cask-fonts/font-fira-code --cask
brew tap homebrew/cask-fonts && brew install homebrew/cask-fonts/font-source-code-pro --cask
```
<TODO: Insert links>
4. Set the following for thin strokes:
```
defaults write -g AppleFontSmoothing -int 0
```
5. Update tmux conf for mac and alacritty config.
6. <TODO: Install necessary tools>
7. <Setting up vim on Mac>
8. Window manager
  - yabai and copy the config.
  ```
  brew install koekeishiya/formulae/yabai
  brew services start koekeishiya/formulae/yabai
  # Go to system preferences and allow yabai
  # System Preference > Privacy > Accessibility > Yabai > Allow
  brew services start yabai
  brew services stop yabai
  brew upgrade yabai
  ```
9. Hotkey set up
  - skhd and copy the config.
  ```
  # System Preferences > Privacy > Accessibility > skhd > Allow
  ```
10. Tools to consider in future
```
brew install autossh
[Tmux conf oh-my-tmux](https://github.com/gpakosz/.tmux)
```

#### Other files in repo
- ~/.alacritty.yml
- ~/.mac.tmux.conf (If using nesting); else use default tmux.conf
