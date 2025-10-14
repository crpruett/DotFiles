#
# ~/.bashrc
#
clear 

printf "\n"
printf "  $s\n" "IP ADDR: $(curl ifconfig.me)"
printf "  $s\n" "USER: $(echo $USER)"
printf "  $s\n" "DATE: $(date)"
printf "  $s\n" "HOSTNAME: $(hostname f)"
printf "  $s\n" "CPU: $(awk -F: '/model name/{print $2}' | head -1)"
printf "  $s\n" "KERNEL: $(uname -rms)"
printf "  $s\n" "Packages: $(dpkg --get-selections | wc -l)"
printf "  $s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
printf "\n"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

HISTCONTROL=ignoredups

alias devfiles='devpod up . --dotfiles git@github.com:crpruett/dotfiles.git'
alias sshkey='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa'

function large_files() {
du -h -x -s -- * | sort -r -h | head -20
}

set -o vi
