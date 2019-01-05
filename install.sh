
source macosdefaults.sh

ln -sv “~/.dotfiles/.git” ~
ln -sv "~/.dotfiles/.vimrc" ~
ln -sv "~/.dotfiles/.zshrc" ~
ln -sv "~/.dotfiles/.vim_runtime" ~

# Update App Store apps
sudo softwareupdate -i -a
# Update Homebrew (Cask) & packages
brew update
brew upgrade
# Update npm & packages
npm install npm -g
npm update -g
# Update Ruby & gems
sudo gem update —system
sudo gem update
