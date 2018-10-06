# zsh config

## oh-my-zsh plugins
plugins=(
  docker
)

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
[ -f $ZSH/oh-my-zsh.sh  ] && source $ZSH/oh-my-zsh.sh
export ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ♜"
export ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ♣"

# lang
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# cd & ls
cd ()
{
    builtin cd "$@" && ls
}

# for history
export HISTSIZE=1000
export HISTCONTROL=ignoreboth:ignorespace:ignoredups
HISTTIMEFORMAT='%Y-%m-%dT%T%z '

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
	peco --query "$LBUFFER" | \
  sed 's/\\n/\n/')
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

## for git checkout
alias gch='git branch -a --sort=-authordate | cut -b 3- | perl -pe '\''s#^remotes/origin/###'\'' | perl -nlE '\''say if !$c{$_}++'\'' | grep -v -- "->" | peco | xargs git checkout'

## tmux
# 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
	tmux
fi

## for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## for kubernetes completion
source <(kubectl completion zsh)
