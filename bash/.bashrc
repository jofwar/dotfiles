# Check for interactive
[[ $- != *i* ]] && return

# Notify of completed background jobs
set -o notify

# Bash options
shopt -s cdspell
shopt -s extglob
shopt -s no_empty_cmd_completion

# History configuration
shopt -s histverify
shopt -s cmdhist
shopt -s histappend

PROMPT_COMMAND="history -a"
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=20000
HISTFILESIZE=${HISTSIZE}
HISTTIMEFORMAT="%F %T "

# Man page colorization
man() {
    LESS_TERMCAP_md=$'\E[01;32m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[1;37;41m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;34m' \
    command man "$@"
}

# Colored listings
if [[ -r ~/.dircolors ]] && type -p dircolors >/dev/null; then
    eval $(dircolors -b "$HOME/.dircolors")
fi

# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Load custom functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Git prompt
if [[ -f /usr/share/git/git-prompt.sh ]]; then
    . /usr/share/git/git-prompt.sh
else
    __git_ps1() { :; }
fi

# Show modified state
GIT_PS1_SHOWDIRTYSTATE=yes

# Git prompt format
GIT="\$(__git_ps1 \" (%s)\")"

# Prompt window title
TITLE='\[\e]2;\u@\h:\W\a\]'

# Prompt colors
RED='\[\033[1;31m\]'
GREEN='\[\033[1;32m\]'
BLUE='\[\033[1;34m\]'
NIL='\[\033[00m\]'

# Prompt format
PS1="${TITLE}${BLUE}\W${RED}${GIT}${GREEN} \$ ${NIL}"