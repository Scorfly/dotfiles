# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt histignorealldups

# init prompt
autoload -Uz promptinit
promptinit

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

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

PS1="%{%F{red}%}%n%{%f%}@%{%F{green}%}%m %{%F{yellow}%}%~ %{%f%}% $ "
