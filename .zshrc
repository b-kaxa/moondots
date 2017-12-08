# zsh config

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
plugins=(git)
[ -f $ZSH/oh-my-zsh.sh  ] && source $ZSH/oh-my-zsh.sh

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# cd & ls
cd ()
{
    builtin cd "$@" && ls
}

# for history
export HISTSIZE=2000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%Y%m%d %T  '
export HISTCONTROL=ignorespace
export HISTCONTROL=ignoredups

# enhancd
[ -f ~/.enhancd ] && source ~/.enhancd/zsh/enhancd.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# colordiff
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# for phpstorm terminal
[[ -f ~/.zshenv ]] && source ~/.zshenv

# source local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# source aliases
[ -f ~/.aliases ] && source ~/.aliases

# for golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# for peco
alias fn='cd "$(find . -type d | peco)"'

# for zsh
bindkey -e

# peco history search
function peco-select-history() {
	local tac
	if which tac > /dev/null; then
		tac="tac"
	else
		tac="tail -r"
	fi
	BUFFER=$(\history -n 1 | \
	eval $tac | \
	peco --query "$LBUFFER")
	CURSOR=$#BUFFER
	zle clear-screen
}

zle -N peco-select-history
bindkey '^r' peco-select-history

# highlighting
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# for direnv
[ -f /usr/local/bin/direnv ] && \
export EDITOR=vim &&
eval "$(direnv hook zsh)"
