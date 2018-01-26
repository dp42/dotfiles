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
alias diary='vim ~/Diary/$(date +%Y/diary-%Y-%m-%d.md)'
# alias memo='vim ~/Notes/$(date +%Y-%m-%d.md)'
alias memof=find_memo

# Prompt
PROMPT='%F{cyan}[%n@%m] $ %f'
RPROMPT="%F{blue}[%~]%f"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '(%b|%a)'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

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

function memo() {
  if [ $# -ne 1 ]; then
    echo "メモのタイトルを入力してください" 1>&2
    return 1
  fi

  date=$(date +%Y-%m-%d-%H%M)
  file="$HOME/Notes/${date}-${1}.md"

  vim $file
}

# メモディレクトリをgrepしてvimで開く
function find_memo() {
  file=$(grep -srnIH $@ ~/Notes | sort -r | peco --query "$LBUFFER" | awk -F : '{print "-c" $2 " " $1}')
  if [ -n "$file" ]; then
    eval "vim $file"
  fi
}

# tmuxのwindow名をカレントディレクトリに変更
function rename-tmux-window() {
  if [ -n "$TMUX" ]; then
    current_dir=${PWD:t}
    tmux rename-window $current_dir
  fi
}

add-zsh-hook precmd rename-tmux-window
