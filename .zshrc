autoload -Uz compinit && compinit
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
autoload -Uz promptinit
promptinit
prompt grml

#History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#Completion settings
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

#Export vim as editor (ranger etc)
VISUAL=vim;
export VISUAL
EDITOR=vim;
export EDITOR
BROWSER=/usr/bin/firefox
export BROWSER

bindkey -e

export PS1="%d %% "

#Conscript is a utility for scala cli apps using sbt as backend
#export CONSCRIPT_HOME="$HOME/.conscript"
#export CONSCRIPT_OPTS="-XX:MaxPermSize=512M -Dfile.encoding=UTF-8"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
# Pip user packages in path
export PATH="$PATH:$HOME/.local/bin"
# Pip user packages in pythonpath
export PYTHONPATH=$(python -c "import site, os; print(os.path.join(site.USER_BASE, 'lib', 'python', 'site-packages'))"):$PYTHONPATH

#fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias zshrc='vim $HOME/.zshrc'
alias seasource='source $HOME/.zshrc'
alias wipe='clear && neofetch'
alias afk='clear && cowsay afk && vlock'
alias l='exa -l -s changed'
alias ls='exa'
set -o ignoreeof
alias g='googler -n 8'
alias m='ncmpcpp'
alias c='clear'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias fox='firefox'
alias gcc='gcc -Wall'
alias r='ranger'
alias unc='unclutter -idle 1 -jitter 150 &'
alias info='info --vi-keys'
alias gping='ping -c 10 8.8.8.8'
alias manx='man --pager="less -p ^EXAMPLES"'
alias week='date +%V'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias takepic='maim -sut 99999'
alias du='du -h --max-depth=1'
alias go='make && gloom/gloom'
alias please='sudo $(fc -ln -1)' # Re-run previous as sudo
alias gimme='sudo pacman -S'
alias pipget='pip install --user'
alias py='python'
alias temp='watch -n 1 sensors'

#CD to root of git project.
cdr() {
   if [[ -z "$(git rev-parse --show-toplevel)" ]]; then
      builtin echo "Error: top level directory not found."
   else
      builtin cd "$(git rev-parse --show-toplevel)"
   fi
}


#SETTINGS FOR CUR PROJECT, REMOVE THESE WHEN DONE
# Path variable of whatever project I'm working on atm
export CDPROJEKT=/home/aslak/Work/eyasys/wps/wps_poc/
alias cdev='cd $CDPROJEKT'

#To get those squeaky clean colors
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

mkcd () {
  mkdir "$1"
  cd "$1"
}

# Samfundet ssh shortcuts
alias mountku='sshfs aslaksm@login.samfundet.no:/home/cassarossa/ku ~/mntssh'
alias mountssf='sshfs aslaksm@login.samfundet.no:/home/cassarossa/ssf ~/mntssh'
export ANDROID_HOME="/home/aslak/Android/Sdk"

export SBT_OPTS="-Xmx4G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss2M  -Duser.timezone=GMT"


export JAVA_HOME=/usr/lib/jvm/default
