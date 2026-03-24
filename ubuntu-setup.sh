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
# deno
curl -fsSL https://deno.land/install.sh | sh
#Nix
sh <$(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
# Create symlinks for existing dotfiles
if [ -f "$HOME/.profile" ]; then
  rm "$HOME/.profile";
fi
ln -s $HOME/repos/dotfiles/zsh/.profile $HOME/.profile
if [ -f "$HOME/.zshrc" ]; then
  rm "$HOME/.zshrc"
fi
ln -s $HOME/repos/dotfiles/zsh/.zshrc $HOME/.zshrc
if [ -f "$HOME/.tmux.conf" ]; then
  rm "$HOME/.tmux.conf"
fi
ln -s $HOME/repos/dotfiles/tmux.conf $HOME/.tmux.conf
if [ -f "$HOME/.vimrc" ]; then
  rm "$HOME/.vimrc"
fi
ln -s $HOME/repos/dotfiles/vim/.vimrc $HOME/.vimrc
mkdir -p "$HOME/.vim/colors" && ln -s $HOME/repos/dotfiles/vim/wombat256mod.vim $HOME/.vim/colors/wombat256mod.vim
mkdir "$HOME/.vim/bundle" &&  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
mkdir "$HOME/.vim/backup" && mkdir "$HOME/.vim/swap"

# Change shell to zsh
chsh -s $(which zsh)
