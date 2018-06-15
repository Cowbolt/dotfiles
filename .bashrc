#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias wipe='clear && neofetch'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias g='googler -n 5'
alias m='ncmpcpp'
alias c='clear'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

