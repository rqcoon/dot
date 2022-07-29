# The following lines were added by compinstall
PROMPT="%n@%m %F{005}%1~ %f%B> %b"

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=* l:|=*' 'r:|[. - _]=** r:|=**'
zstyle :compinstall filename '/home/rqc/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
