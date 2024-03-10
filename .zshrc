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

export PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/bin
export GOPATH=$HOME/go

export DOCKER_BUILDKIT=1

function powerline_precmd() {
    PS1="$($GOPATH/bin/powerline-go -shell 'zsh' -error $? -jobs ${${(%):%j}:-0})"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

install_powerline_precmd

source ~/.config/zsh/completion.zsh
source ~/.config/zsh/key-bindings.zsh

alias vim="nvim"
