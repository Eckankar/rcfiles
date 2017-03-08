# my silly prompt {{{
autoload -U promptinit
promptinit
prompt adam2 gray yellow green white
RPS1='[%*]'
# }}}
# completion {{{
. ~/.zshcomplete
# }}}
# history {{{
HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt share_history
setopt hist_ignore_space
# }}}
# plugins {{{
autoload copy-earlier-word
zle -N copy-earlier-word

autoload edit-command-line
zle -N edit-command-line
# }}}
# miscellaneous options {{{
setopt nobeep # I hates the beeps
setopt auto_cd # typing just a directory name cds into it
setopt multios # built-in tee
setopt extended_glob
setopt nullglob # it's not an error for a glob to expand to nothing
setopt list_ambiguous
setopt no_nomatch
setopt interactivecomments # Allow comments even in the interactive shell
setopt listpacked # column width doesn't have to be constant
setopt complete_in_word # hitting tab on the f in Mafile does the right thing
# }}}
# aliases {{{
alias mosml="rlwrap mosml"
alias mosml201="rlwrap ~/build/mosml201/bin/mosml"
alias twelf-server="rlwrap twelf-server"
alias screen="screen -U"
# }}}
# add color to some things {{{
alias ls='ls -h --color'
alias grep='grep --color=auto'
alias ack='ack --color'
# Such as Mathematica
export XLIB_SKIP_ARGB_VISUALS=1
# }}}
# shortcuts {{{
alias i='sudo apt-get install'
alias s='apt-cache search'
alias clear='clear; fortune'
alias less='less -R'
# }}}
# fortune {{{
if which fortune >/dev/null; then
    fortune
fi
# }}}
# keybinds {{{
bindkey -v

# Fix a few keys
# PuTTY:
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
# Linux terminals
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line

# Common
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char

# History search on ^R
bindkey '^R' history-incremental-search-backward

# Don't freeze my terminal with Ctrl-S, please. Kthx.
stty -ixon -ixoff
# }}}
# utilities {{{
# Enable autojump goodness
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh && autoload -U compinit && compinit
# }}}
