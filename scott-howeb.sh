set -o vi

## ALIASES

alias ,='cd ..'
alias ,,='cd ../..'
alias ,,,='cd ../../..'
alias c='clear'
alias info='info --vi-keys'
alias l='ls -CF'
alias la='ls -Al'
alias lg='ls -A -l --group-directories-first'
alias lk='ls -hlrt'
alias ll='ls -hl'
alias lld='ls -hld'
alias lz='ls -Z'

alias D='date +%Y%m%d'
alias d='date +%y%m%d'
alias dig='dig +noall +answer'
alias dux='du --max-depth=1'
alias duxn='dux | sort -n'
alias ping='ping -c3'
alias rmsync='rsync --remove-source-files -Pavz'
alias rs='rsync -POavz'
alias s='date +%s'
alias tarrm='tar --remove-files'
alias grepi='grep -i'
alias ssc='sudo systemctl'
alias sjc='sudo journalctl'

## laravel artisan

alias a='php artisan'
alias am='php artisan migrate --step'
alias ams='php artisan migrate:status'
alias amrs='php artisan migrate:refresh --seed'
alias taill='tail -f storage/logs/laravel.log'

## git

alias gitr='echo "$ git remote show origin"; git remote show origin'
alias gits='echo "$ git status"; git status'
alias gitl='git log --pretty=oneline'
alias iptl='iptables --line-numbers -nL'

## nginx

alias webacc='tail -f /var/log/nginx/access.log'
alias weberr='tail -f /var/log/nginx/error.log'

function weblog() {
	select logf in /var/log/nginx/*.log; do
		tail -f $logf
	done;
}

