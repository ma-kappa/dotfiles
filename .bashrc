# .bashrc
#----------------------------------------------------------------------------------------------
#
#   Author: ma-kappa
#   Description: File used to hold Bash configuration, aliases, functions, completions, etc...
#
#   Sections:
#   1.  ENVIRONMENT SETUP
#   2.  MAKE TERMINAL BETTER
#   3.  FOLDER MANAGEMENT
#   4.  MISC ALIAS'
#   5.  GIT SHORTCUTS
#   6.  OPERATING SYSTEM SPECIFIC DEFINITIONS
#   7.  PROMPT SETUP
#   8.  LOCAL SPECIFIC SETTINGS
#
#----------------------------------------------------------------------------------------------
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Supports Git functions, aliases, completion
if [ -f ~/dotfiles/.bashrc.git ]; then
    source ~/dotfiles/.bashrc.git
fi

#----------------------------------------------------------------------------------------------
#  1.  ENVIRONMENT SETUP
#----------------------------------------------------------------------------------------------
# Set colors to variables
BLACK="\[\033[0;30m\]"
BLACKB="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
REDB="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
GREENB="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
YELLOWB="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BLUEB="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PURPLEB="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
CYANB="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
WHITEB="\[\033[1;37m\]"

#----------------------------------------------------------------------------------------------
#   2.  MAKE TERMINAL BETTER
#----------------------------------------------------------------------------------------------
# Common aliases
if [ -f ~/dotfiles/.aliases ]; then
    source ~/dotfiles/.aliases
fi

# Misc Commands
alias resource='source ~/.bash_profile'         # Source bash_profile
bash-as() { sudo -u $1 /bin/bash; }             # Run a bash shell as another user

#----------------------------------------------------------------------------------------------
#   3.  FOLDER MANAGEMENT
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
#   4.  MISC ALIAS'
#----------------------------------------------------------------------------------------------
# Separately defined in dotfile/.aliases

#----------------------------------------------------------------------------------------------
#   5.  GIT SHORTCUTS
#----------------------------------------------------------------------------------------------
# Separately defined in dotfile/.bashrc.git

#----------------------------------------------------------------------------------------------
#   6.  OPERATING SYSTEM SPECIFIC DEFINITIONS
#----------------------------------------------------------------------------------------------
case "${OSTYPE}" in
# MacOSX
darwin*)
    if [ -f ~/dotfiles/.bashrc.osx ]; then
        source ~/dotfiles/.bashrc.osx
    fi
    ;;
# Linux
linux*)
    if [ -f ~/dotfiles/.bashrc.linux ]; then
        source ~/dotfiles/.bashrc.linux
    fi
    ;;
esac

#----------------------------------------------------------------------------------------------
#  7.  PROMPT SETUP
#----------------------------------------------------------------------------------------------
# Modify the prompt - Spacegray
if [[ ${USE_GIT_PROMPT} = 1 ]]; then
    # Use Git-Prompt
    export PS1=$CYAN'\u'$WHITE' at '$BLUE'\h'$WHITE' → '$PURPLE'[\w]\e[0m$(git_color)$(__git_ps1)'$WHITE$'\n$ '
else
    # Can not use Git-Prompt
    export PS1=$CYAN'\u'$WHITE' at '$BLUE'\h'$WHITE' → '$PURPLE'[\w]\e[0m$(git_color)$(git_branch)'$WHITE$'\n$ '
fi

# Set tab name to the current directory
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# Add color to terminal
export CLICOLOR=1
export LSCOLORS=GxExBxBxFxegedabagacad

# Print the date
# if it is SCP connection, do not execute the 'date' command.
if [ "$SSH_TTY" != "" ]; then
  date
fi

#----------------------------------------------------------------------------------------------
#  9.  LOCAL SPECIFIC SETTINGS
#----------------------------------------------------------------------------------------------
# Load local specific settings. However, only if the file exists.
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
