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

# Start up the SSH agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# When NVM is installed, we load it.
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# Add Composer to the path
PATH=$PATH:/home/tamboer/.composer/vendor/bin/
export PATH

# Initialize phpbrew if it is installed
export PHPBREW_SET_PROMPT=1
export PHPBREW_RC_ENABLE=1
[ -f "$HOME/.phpbrew/bashrc" ] && source "$HOME/.phpbrew/bashrc"

# Add Android Studio to the path
PATH=$PATH:/opt/android-studio/bin/

# Android setup
export ANDROID_HOME=~/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH

# Java Home
export JAVA_HOME="/etc/alternatives/java_sdk"

