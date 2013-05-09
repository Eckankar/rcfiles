# Add my local ~/bin to path
export PATH=~/bin:~/.cabal/bin:$PATH

# App::Nopaste
export NOPASTE_SERVICES='Pastie Codepeek Gist PastebinCom'

# Default editor = vim
export EDITOR=vim

# Ack color settings
export ACK_COLOR_FILENAME=clear
export ACK_COLOR_MATCH=red

# Include local config
. ~/.zshenv.local
