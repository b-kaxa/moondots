# zsh config

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# my lovely alias
## for mac
alias home="cd ~/Documents/"

## vagrant 
alias vs="vagrant ssh"
alias vu="vagrant up"
alias vh="vagrant halt"

## git
alias g="git"
alias greset="git reset --hard HEAD\^"
alias gl="git log --color --graph"

## zsh
alias zshrc="vi ~/.zshrc"
alias szsh="source ~/.zshrc"
autoload -U compinit
compinit

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

# fuck
alias fuck='eval $(thefuck $(fc -ln -1))'
alias FUCK='fuck'

# pip
export WORKON_HOME=$HOME/virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# enhancd
source ~/.enhancd/zsh/enhancd.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
