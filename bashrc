# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history.
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1" ;;
	*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so: > sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## customizations below here

set -o vi
export EDITOR=vim
export VISUAL=vim
export PAGER=less
umask 002			# umask 007 - this is a little harsh w.r.t. playing nice with others - perhaps on server
# https://github.com/jamessan/vim-gnupg
GPG_TTY=`tty`
export GPG_TTY

[ -f ~/.aliases ]		&& . ~/.aliases
[ -f /etc/bash_completion ]	&& ! shopt -oq posix && . /etc/bash_completion
[ -f ~/.tidyrc ]		&& export HTML_TIDY="~/.tidyrc"
[ -f ~/.envrc ]			&& . ~/.envrc
[ -d /opt/phpstorm/bin ]	&& PATH="$PATH:/opt/phpstorm/bin"
[ -d /usr/local/phpstorm/bin ]	&& PATH="$PATH:/usr/local/phpstorm/bin"
[ -d /usr/local/netbeans/bin ]	&& PATH="$PATH:/usr/local/netbeans/bin"
[ -d /opt/idea/bin ]		&& PATH="$PATH:/opt/idea/bin"
[ -d /opt/rubymine/bin ]	&& PATH="$PATH:/opt/rubymine/bin"
[ -d /opt/pycharm/bin ]		&& PATH="$PATH:/opt/pycharm/bin"
[ -d /opt/datagrip/bin ]	&& PATH="$PATH:/opt/datagrip/bin"
[ -d ~/.mozilla ]		&& export MOZILLA_HOME=~/.mozilla
[ -d /opt/forticlient-sslvpn/64bit ] && PATH="$PATH:/opt/forticlient-sslvpn/64bit"

## IDEA IntelliJ - ibus
export IBUS_ENABLE_SYNC_MODE=1

## ZEND
# [ -d $HOME/src/zend/bin ] && PATH="$PATH:$HOME/src/zend/bin"

## JAVA
[ -d /opt/java/bin ] && PATH="$PATH:/opt/java/bin" && export JDK_HOME=/opt/java && export JAVA_HOME=/opt/java
[ -a /opt/mysql-connector-java.jar ] && CLASSPATH="/opt/mysql-connector-java.jar"
[ -d $HOME/src/java ] && CLASSPATH="$CLASSPATH:$HOME/src/java/jars/*"
[ -d /usr/share/tomcat8 ] && export CATALINA_HOME=/usr/share/tomcat8

export CLASSPATH

## MAVEN
if [ -d /usr/local/maven/bin ]; then
	PATH="$PATH:/usr/local/maven/bin"
	export M2_HOME=/usr/local/maven
	export M2=$M2_HOME/bin
elif [ -d /usr/share/maven/bin ]; then
	PATH="$PATH:/usr/share/maven/bin"
	export M2_HOME=/usr/share/maven
	export M2=$M2_HOME/bin
fi

[ -d /opt/gradle/bin ] && export GRADLE_HOME=/opt/gradle && PATH="$PATH:$GRADLE_HOME/bin"

## OPENNLP
[ -d /opt/opennlp/bin ] && export OPENNLP_HOME=/opt/opennlp && PATH="$PATH:$OPENNLP_HOME/bin"

## ELASTICSEARCH
[ -d /usr/share/elasticsearch ] && export ELASTIC=/usr/share/elasticsearch && PATH="$PATH:$ELASTIC/bin"

## VAGRANT
[ -d /opt/vagrant ] && export PATH="$PATH:/opt/vagrant"
[ -d /data/vagrant ] && export VAGRANT_HOME=/data/vagrant

# xmodmap -e "remove lock = Caps_Lock"
# xmodmap -e "clear Lock"

# export PS1='\[\033[1;33m\]\u@\h:\w$\[\033[00m\] ' ## yellow
export PS1='\[\033[0;31m\]\u@\h:\w$\[\033[00m\] '   ## red
# export AWS_DEFAULT_PROFILE=hydro

if [ -d $HOME/perl5 ]; then
	export PERL_LOCAL_LIB_ROOT="$HOME/perl5";
	export PERL_MB_OPT="--install_base $HOME/perl5";
	export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5";
	export PERL5LIB="$HOME/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:$HOME/perl5/lib/perl5";
	PATH="$HOME/perl5/bin:$PATH";
fi

[ -d /opt/openssl-1.0.1g/bin ] && export PATH="/opt/openssl-1.0.1g/bin:$PATH"
[ -d $HOME/.chttps://getcomposer.org/installeromposer/vendor/bin ] && PATH="$PATH:$HOME/.composer/vendor/bin"
[ -d $HOME/.config/composer/vendor/bin ] && PATH="$PATH:$HOME/.config/composer/vendor/bin"

## Golang
[ -d ~/src/go ] && export GOPATH="$HOME/src/go" && PATH="$PATH:$GOPATH/bin"
[ -d /usr/local/go ] && export GOROOT=/usr/local/go && PATH="$PATH:$GOROOT/bin"

## wp-cli tab completion
[ -f ~/bin/wp-cli/utils/build-local ] &&  source ~/bin/wp-cli/utils/build-local
[ -f ~/bin/wp-completion.bash ] &&  source ~/bin/wp-completion.bash
[ -f $HOME/bash/wp-completion.bash ] && source $HOME/bash/wp-completion.bash

## ruby on rails - rbenv
# [ -f $HOME/.rubyrc ] && source $HOME/.rubyrc
# ruby add rvm to path for scripting
[ -d $HOME/.rvm/bin ] && PATH="$PATH:$HOME/.rvm/bin"

## python
[ -f $HOME/.pythonrc ] && . $HOME/.pythonrc
[ -d ~/.local/bin ] && PATH="$PATH:~/.local/bin"
alias python=python3
alias pip=pip3
alias activate='source .venv/bin/activate'

## laravel spark
[ -d /data/laravel/spark-installer ] && PATH="$PATH:/data/laravel/spark-installer"

## deno.land
[ -d /home/scott/.deno ] && export DENO_INSTALL="/home/scott/.deno" && PATH="$DENO_INSTALL/bin:$PATH"

## Depot Tools from Google in Python
[ -d $HOME/src/v8/depot_tools ] && PATH="$PATH:$HOME/src/v8/depot_tools"

## PATH set final

export PATH=".:$HOME/bin:bin:vendor/bin:node_modules/.bin:$PATH"

# BitWarden localhost
export BW_SESSION="Nhe7Jo4zh+c/eHNqt2L3TnNyb8x71eQ/QKuvQcCYlztgAnhDw6/LBpJy5LMicQ3x/wV1mZbfbqO9CekF/8amAA=="

