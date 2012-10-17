# Bash
ln -f ~/.dotfiles/bashrc ~/.bashrc

# VIM
rm -rf ~/.vim ~/.vimrc
ln -sf ~/.dotfiles/vim ~/.vim
ln -f ~/.dotfiles/vim/vimrc ~/.vimrc

# TMUX
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

# Git Config
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
