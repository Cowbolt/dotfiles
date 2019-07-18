#Vim mode

bindkey -v
bindkey 'jk' vi-cmd-mode

if [ -r ~/.zshrc -a -r ~/.zshrc.global -a ! -r ~/.zshrc.local ] ; then
    printf '-!-\n'
    printf '-!- Looks like you are using the old zshrc layout of grml.\n'
    printf '-!- Please read the notes in the grml-zsh-refcard, being'
    printf '-!- available at: http://grml.org/zsh/\n'
    printf '-!-\n'
    printf '-!- If you just want to get rid of this warning message execute:\n'
    printf '-!-        touch ~/.zshrc.local\n'
    printf '-!-\n'
fi

#Conscript is a utility for scala cli apps using sbt as backend
export CONSCRIPT_HOME="$HOME/.conscript"
export CONSCRIPT_OPTS="-XX:MaxPermSize=512M -Dfile.encoding=UTF-8"
export PATH=:$PATH


alias zshrc='vim $HOME/.zshrc'
alias seasource='source $HOME/.zshrc'
alias wipe='clear && neofetch'
alias afk='clear && cowsay afk && vlock'
alias l='exa -l'
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

#skip to Examples
alias manx='man --pager="less -p ^EXAMPLES"'

#CD to root of git project.
cdr() {
   if [[ -z "$(git rev-parse --show-toplevel)" ]]; then
      builtin echo "Error: top level directory not found."
   else
      builtin cd "$(git rev-parse --show-toplevel)"
   fi
}


#SETTINGS FOR CUR PROJECT, REMOVE THESE WHEN DONE
#Path variable of whatever project I'm working on atm
export CDPROJEKT=/home/aslak/Eyasys/WPS/Scala/dev/client-server_mvp

alias cdev='cd $CDPROJEKT'
alias sbt='cdev && sbt'

#PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/opt/android-sdk/tools:/opt/android-sdk/tools/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/aslak/.local/bin:$CONSCRIPT_HOME/bin
export ANDROID_SDK_ROOT=/home/aslak/Android
export ANDROID_NDK_ROOT=/home/aslak/Android
export TUT_DIR=/home/aslak/TDT4295/chisel-tutorial

#To get those squeaky clean colors
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

mkcd () {
  mkdir "$1"
  cd "$1"
}

# Samfundet ssh shortcuts
alias mountku='sshfs samf:/home/cassarossa/ku ~/mntssh'
alias mountssf='sshfs samf:/home/cassarossa/ssf ~/mntssh'
export ANDROID_HOME="/home/aslak/Android"

#Compile cache: Used for LineageOS build
#export USE_CCACHE=1
#Jack is the currently used Java toolchain for building LineageOS 14.1 and up.
#It is known to run out of memory often if not configured correctly - a simple fix is to run this command:
# export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk



export SBT_OPTS="-Xmx4G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss2M  -Duser.timezone=GMT"

