#!/bin/bash

## bash preferences - source this file

set -o vi
umask 002

# ALIASES

alias info='info --vi-keys'
alias ll='ls -hl'
alias lk='ls -hlrt'
alias la='ls -Al'
alias l='ls -CF'
alias c='clear'
alias ,='cd ..'
alias tarrm='tar --remove-files'
alias dux='du --max-depth=1'
alias D='date +%Y%m%d'
alias d='date +%y%m%d'
alias s='date +%s'
alias rs='rsync -POavz'
alias rmsync='rsync --remove-source-files -Pavz'
alias xclipv='xclip -selection clipboard'
alias dig='dig +noall +answer'
alias weberr='tail -f /var/log/nginx/error.log'
alias webacc='tail -f /var/log/nginx/access.log'
alias iptl='iptables --line-numbers -nL'
