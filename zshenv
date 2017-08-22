# Add my local ~/bin to path
export PATH=~/bin:~/.cabal/bin:$PATH

# Default editor = vim
export EDITOR=vim

# Ack color settings
export ACK_COLOR_FILENAME=clear
export ACK_COLOR_MATCH=red

# GPG, please use this TTY, kthx
export GPG_TTY=$(tty)

# Work-around for composition bug with Mathematica
export XLIB_SKIP_ARGB_VISUALS=1

# Include local config
. ~/.zshenv.local
