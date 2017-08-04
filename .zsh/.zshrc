#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Command History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 入力内容からコマンド履歴を検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# lsを着色
eval $(dircolors ~/.dircolors)

# ビープ音無効化
setopt nobeep
setopt nolistbeep

# alias
alias ls='ls --color=auto'
alias ll='ls -al'
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'
alias memo='vim ~/Notes/$(date +%Y/%Y-%m-%d.md)'

# gitのリポジトリ名を取得
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%r'

#
# Peco functions
#
function peco-src() {
    local selected_dir=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${GOPATH}/src/${selected_dir}"
        zle accept-line
    fi
    zle redisplay
}
zle -N peco-src
stty -ixon
bindkey '^s' peco-src

function peco-select-history() {
    BUFFER=$(fc -l -r -n 1 | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# tmuxのwindowをカレントディレクトリorリポジトリ名に変更
function rename-tmux-window() {
  if [ -n "$TMUX" ]; then
    vcs_info
    if [ -n "${vcs_info_msg_0_}" ]; then
      current_repo=${vcs_info_msg_0_}
      tmux rename-window $current_repo
    else
      current_dir=${PWD:t}
      tmux rename-window $current_dir
    fi
  fi
}

add-zsh-hook precmd rename-tmux-window
