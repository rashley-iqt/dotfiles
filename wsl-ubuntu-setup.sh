#! /bin/sh

# setup shell
sudo apt install -y zsh
mkdir -p $HOME/.local/bin

# Shell utilities
sudo apt install -y eza bat git-delta gh fonts-powerline powerline


#Shell extensions
curl -L git.io/antigen > $HOME/.local/bin/antigen.zsh
curl -sS https://starship.rs/install.sh | sh

# Dev envs
# Pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

#UV
curl -LsSf https://astral.sh/uv/install.sh | sh
# Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
#Nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# Create symlinks for existing dotfiles
rm .profile && ln -s /mnt/c/Users/rashley/repos/dotfiles/zsh/.profile .profile
rm .zshrc && ln -s /mnt/c/Users/rashley/repos/dotfiles/zsh/.zshrc .zshrc
ln -s /mnt/c/Users/rashley/repos/dotfiles/tmux.conf .tmux.conf
ln -s /mnt/c/Users/rashley/repos/dotfiles/vim/.vimrc .vimrc
mkdir -p .vim/colors && ln -s /mnt/c/Users/rashley/repos/dotfiles/vim/wombat256mod.vim .vim/colors/wombat256mod.vim
mkdir .vim/bundle &&  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir .vim/backup && mkdir .vim/swap

# Change shell to zsh
chsh -s $(which zsh)