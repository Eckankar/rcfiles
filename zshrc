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
# replace default utilities {{{
alias top="htop"
# }}}
# add color to some things {{{
alias ls='ls -G --color'
alias grep='grep --color=auto'
alias ack='ack --color'
export ACK_COLOR_FILENAME=clear
export ACK_COLOR_MATCH=red
# Such as Mathematica
export XLIB_SKIP_ARGB_VISUALS=1
# }}}
# telnet services (nao, termcast, etc) {{{
alias nao="(TERM='rxvt'; telnet nethack.alt.org)"
#alias termcast="telnet termcast.org"
# }}}
# shell accounts {{{
alias galois="ssh m06spt@galois.math.ku.dk"
alias shannon="ssh m06spt@shannon.math.ku.dk"
alias brok="ssh -X sebbe@brok.diku.dk"
alias ask="ssh -X sebbe@ask.diku.dk"
# }}}
# shortcuts {{{
alias i='sudo apt-get install'
alias s='apt-cache search'
alias clear='clear; fortune'
alias less='less -R'
alias wizmode='sudo /usr/games/nethack -D'
# }}}
# global shortcuts (don't need to be in the command position) {{{
alias -g L='|vimpager'
alias -g G='|ack'
alias -g H='|head'
alias -g T='|tail'
alias -g W='|wc'
# }}}
# fortune {{{
if which fortune.pl >/dev/null; then
    fortune.pl
elif which fortune >/dev/null; then
    fortune
fi
# }}}
# environment variables {{{
# App::Nopaste
export NOPASTE_SERVICES='Codepeek Gist Pastie PastebinCom'
# Default editor = vim
export EDITOR=vim
# }}}
# keybinds {{{
# Fix a few keys in putty
bindkey -v '^[[1~' beginning-of-line
bindkey -v '^[[2~' overwrite-mode
bindkey -v '^[[3~' delete-char
bindkey -v '^[[4~' end-of-line
# }}}
