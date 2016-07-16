# zsh config

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
plugins=(git)
[ -f $ZSH/oh-my-zsh.sh  ] && source $ZSH/oh-my-zsh.sh

export LC_ALL=pt_BR.UTF-8
export LANG=pt_BR.UTF-8

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

# source local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# source aliases
[ -f ~/.aliases ] && source ~/.aliases
