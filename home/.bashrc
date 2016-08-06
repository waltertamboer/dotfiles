#!/usr/bin/env bash
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Colors (http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html)
blue="\033[0;34m"
white="\033[0;37m"

# Brackets needed around non-printable characters in PS1
ps1_blue='\['"$blue"'\]'
ps1_white='\['"$white"'\]'

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
source "$HOME/.homesick/repos/waltertamboer/home/.git-prompt.sh"

export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT_COMMAND='__git_ps1 "$ps1_blue\u@\h$ps1_white \W" " \\\$ "'

# When NVM is installed, we load it.
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"

# Add Composer to the path
PATH=$PATH:/home/tamboer/.composer/vendor/bin/
export PATH

# Initialize phpbrew if it is installed
export PHPBREW_SET_PROMPT=1
export PHPBREW_RC_ENABLE=1
[ -f "$HOME/.phpbrew/bashrc" ] && source "$HOME/.phpbrew/bashrc"

# Add Android Studio to the path
PATH=$PATH:/opt/android-studio/bin/
export PATH

# Java Home
export JAVA_HOME="/etc/alternatives/java_sdk"

