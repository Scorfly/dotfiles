# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Pluggins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Don't share history
setopt append_history no_inc_append_history no_share_history

# Use modern completion system
autoload -Uz compinit
compinit

autoload -U bashcompinit
bashcompinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliases
alias ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable'
alias ll='ls -lArth'
alias la='ls -a'
alias lla='ls -la'
alias less='less --quiet'
alias df='df --human-readable'
alias du='du --human-readable'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias grep='grep --color=auto'
alias install='sudo apt-get install'
alias azerty='setxkbmap fr'
alias bepo='setxkbmap fr bepo'

# import conf which is not shared
if [ -f ~/.zsh_local ]; then
    source ~/.zsh_local
fi

if [ -f ~/xdsl/connectivity-welcome/dotfiles/bash_aliases_connectivity ]; then
    source ~/xdsl/connectivity-welcome/dotfiles/bash_aliases_connectivity
fi


# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' [%b]'

PS1="%{%F{red}%}%n%{%f%}@%{%F{green}%}LinuxLaptop %{%F{yellow}%}%~%{%F{magenta}%}${vcs_info_msg_0_}%{%f%} $ "

# Prompt
PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+="%{$fg[magenta]%}%n%{$reset_color%} [%{$fg[green]%}%m%{$reset_color%}]"
PROMPT+=' %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)$ '
