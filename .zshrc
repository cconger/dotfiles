# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=65535
SAVEHIST=65535

setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
setopt interactive_comments

setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cconger/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"

export PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/bin
export GOPATH=$HOME/go

export DOCKER_BUILDKIT=1

alias vim="nvim"

function notes {
  mkdir -p ~/notes
  vim ~/notes/$(date +%Y-%m).md
}
