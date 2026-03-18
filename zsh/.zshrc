source $HOME/.local/bin/antigen.zsh
source /etc/profile.d/nix.sh
export PATH=$HOME/.local/bin:$PATH

antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

export XDG_CONFIG_HOME=$HOME/.config

alias ls="exa"
alias cat="batcat"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init - zsh)"

eval "$(starship init zsh)"

export PATH=$PATH:/opt/mutagen

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH='/home/ryan/.duckdb/cli/latest':$PATH

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

eval "$(uv generate-shell-completion zsh)"
export ZED_ALLOW_EMULATED_GPU=1
alias zed="WAYLAND_DISPLAY='' zed"
. "$HOME/.deno/env"
