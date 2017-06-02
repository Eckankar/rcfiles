" vim:foldmethod=marker commentstring="%s

" Vundle bundles {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Enhanced twelf syntax highlighting
Plugin 'ahf/twelf-syntax'

" Syntax checking for a number of languages
Plugin 'scrooloose/syntastic'

" git-support for vim
Plugin 'tpope/vim-fugitive'

" Ragel syntax
Plugin 'jneen/ragel.vim'

" org-mode for vim
Plugin 'hsitz/VimOrganizer'
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()

" Haskell integration
Plugin 'Shougo/vimproc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'lukerandall/haskellmode-vim'

" Syntax highlighting for Kleenex
Plugin 'diku-kmc/repg', {'rtp': 'vim/'}

" Rust syntax
Plugin 'rust-lang/rust.vim'

" F* support
Plugin 'FStarLang/VimFStar'

" Mathematica syntax
Plugin 'rsmenon/vim-mathematica'

call vundle#end()

" }}}
" General options {{{
" Miscellaneous {{{
set nocompatible

" indentation FTW.. also plugins FTW! heh
filetype indent plugin on

" automatically flush to disk when using :make, etc.
set autowrite

" automatically read in external changes if we haven't modified the buffer
set autoread

" everything needs to be unicode. EVERYTHING
set encoding=utf8

" always join with just one space, even between sentences
set nojoinspaces

" don't move the cursor to the start of the line when changing buffers
set nostartofline
"}}}
" Display {{{
" color!
syntax on

" lines, cols in status line
set ruler

" display more information in the ruler
set rulerformat=%40(%=%t%h%m%r%w%<\ (%n)\ %4.7l,%-7.(%c%V%)\ %P%)

" current mode in status line
set showmode

" display the number of (characters|lines) in visual mode, also cur command
set showcmd

" a - terse messages (like [+] instead of [Modified]
" o - don't show both reading and writing messages if both occur at once
" t - truncate file names
" T - truncate messages rather than prompting to press enter
" W - don't show [w] when writing
" I - no intro message when starting vim fileless
set shortmess=aotTWI

" no extra status lines
set laststatus=0

" display as much of the last line as possible if it's really long
" also display unprintable characters as hex
set display+=lastline,uhex

" give three lines of context when moving the cursor around
set scrolloff=3

" don't redraw the screen during macros etc (NetHack's runmode:teleport)
set lazyredraw

" highlight all matches, we'll see if this works with a different hilight
set hlsearch

" clear search highlighting with space
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" highlight matching parens for .2s
set showmatch
set matchtime=2

" threshold for reporting number of lines changed
set report=0

" I generally don't want to have to space through things.. :)
set nomore

" only show a menu for completion, never a preview window or things like that
set completeopt=menuone

" I want my splits done on the proper side
set splitbelow
set splitright

" Language specific features {{{
" Perl {{{
" highlight advanced perl vars inside strings
let perl_extended_vars=1

" POD!
let perl_include_pod=1

" perl needs lots of syncing...
let perl_sync_dist=1000
" }}}
" }}}
"}}}
" Improve power of commands {{{
" incremental search!
set incsearch

" backspace over autoindent, end of line (to join lines), and preexisting test
set backspace=indent,eol,start

" tab completion in ex mode
set wildmenu

" when doing tab completion, ignore files with any of the following extensions
set wildignore+=.out,.o,.aux,.pdf

" remember lotsa fun stuff
set viminfo=!,'1000,f1,/1000,:1000,<1000,@1000,h,n~/.viminfo

" add : as a file-name character (mostly for Perl's mod::ules)
set isfname+=:

" tab completion stuff for the command line
set wildmode=longest,list,full

" format using par
set formatprg=par\ -w78

" persistent undo
if exists("+undofile")
    set undofile
    set undodir=/var/tmp/vim-sebbe/undo
endif
"}}}
" Make vim less whiny {{{
" :bn with a change in the current buffer? no prob!
set hidden

" no bells whatsoever
set vb t_vb=

" if you :q with changes it asks you if you want to continue or not
set confirm

" 50 milliseconds for escape timeout instead of 1000
set ttimeoutlen=50

" send more data to the terminal in a way that makes the screen update faster
set ttyfast
"}}}
" Indentation {{{
" no-longer skinny tabs!
set tabstop=4

" set to the same as tabstop (see #4 in :help tabstop)
set shiftwidth=4

" if it looks like a tab, we can delete it like a tab
set softtabstop=4

" no tabs! spaces only..
set expandtab

" < and > will hit indentation levels instead of always -4/+4
set shiftround

" new line has indentation equal to previous line
set autoindent

" braces affect autoindentation
set smartindent

" keep visual after indenting
vnoremap < <gv
vnoremap > >gv
"}}}
" Folding {{{
" fold only when I ask for it damnit!
set foldmethod=marker

" close a fold when I leave it
set foldclose=all
"}}}
" Swap files {{{
set backupdir=/var/tmp/vim-sebbe/swap
set directory=/var/tmp/vim-sebbe/swap
" }}}
" Added commands {{{
" Use w!! to write as sudo
command! -nargs=0 SudoWrite call SaveAsSudo()
cmap w!! SudoWrite
" }}}
"}}}
" Colors {{{
" miscellaneous {{{
" enable 256-color mode
set t_Co=256

" pick a lovely colorscheme
colorscheme desert
" }}}
" nicer colors for diff {{{
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
" }}}
" word completion menu {{{
highlight Pmenu      ctermfg=grey  ctermbg=darkblue
highlight PmenuSel   ctermfg=red   ctermbg=darkblue
highlight PmenuSbar  ctermbg=cyan
highlight PmenuThumb ctermfg=red

highlight WildMenu ctermfg=grey ctermbg=darkblue
"}}}
" folding {{{
highlight Folded     ctermbg=black ctermfg=darkgreen
"}}}
" hlsearch {{{
highlight Search NONE ctermfg=lightred
"}}}
" color end of line whitespace {{{
autocmd BufReadPost * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/ containedin=ALL
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/ containedin=ALL
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/ containedin=ALL
hi EOLWS ctermbg=red
" }}}
" highlight line 81 for IP {{{
if expand("%:p") =~? "Instruktorater/IP"
    set listchars=tab:>-
    set list
    set textwidth=80
    set colorcolumn=+1
endif
" }}}
" highlight tabs in source files {{{
set listchars=tab:>-
set list
" }}}
"}}}
" Autocommands {{{
" When editing a file, always jump to the last cursor position {{{
autocmd BufReadPost *
\  if line("'\"") > 0 && line("'\"") <= line("$") |
\    exe "normal g`\"" |
\  endif
"}}}
" Skeletons {{{
autocmd BufNewFile *.pm silent 0read ~/.vim/skeletons/perl.pm | call Modulify('::') | normal G3k

autocmd BufNewFile *.pl silent 0read ~/.vim/skeletons/perl.pl | normal G
autocmd BufNewFile *.t silent 0read ~/.vim/skeletons/test.t | normal G
autocmd BufNewFile Makefile.PL silent undo | silent 0read ~/.vim/skeletons/Makefile.PL | normal gg

autocmd BufNewFile *.c  silent 0read ~/.vim/skeletons/c.c | normal 3j$
autocmd BufNewFile *.h  silent call CHeaderSkeleton()

autocmd BufNewFile *.tex silent 0read ~/.vim/skeletons/latex.tex | setlocal filetype=tex | normal G3k

autocmd BufNewFile *.cpp silent call CPPSkeleton()

autocmd BufReadPost *.sml silent setlocal filetype=sml tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufReadPost *.sig silent setlocal filetype=sml tabstop=2 softtabstop=2 shiftwidth=2

autocmd BufNewFile,BufRead * if &syntax == '' | setlocal syntax=perl | endif
"}}}
" Auto +x {{{
au BufWritePost *.{sh,pl} silent exe "!chmod +x %"
"}}}
" :make commands {{{
" No pressing enter after make {{{
cabbrev make call MakeNoEnter()
" }}}
" Perl :make does a syntax check {{{
autocmd FileType perl setlocal makeprg=$VIMRUNTIME/tools/efm_perl.pl\ -c\ %\ $*
autocmd FileType perl setlocal errorformat=%f:%l:%m
autocmd FileType perl setlocal keywordprg=perldoc\ -f
"}}}
" SML make code {{{
autocmd FileType sml setlocal makeprg=mosml\ -P\ full\ '%'
" }}}
" Python make code {{{
autocmd FileType python setlocal makeprg=python\ '%'
" }}}
" LaTeX make code {{{
autocmd FileType tex call SetTexMakeprg()
" }}}
"}}}
" Automatically reload vimrc on changes {{{
autocmd bufwritepost .vimrc source $MYVIMRC
" }}}
"}}}
" Insert-mode remappings/abbreviations {{{
" keybinds {{{
set pastetoggle=<F12>
" }}}
" }}}
" Functions {{{
fun! Modulify(replace)
    exec "/Foo"
    silent :.s#Foo#\=expand("%")#
    silent :.s#\.pm;#;#
    silent :.s#lib/##e
    silent :.s# /# #e
    silent :.s#/#\=a:replace#ge
endfun

fun! CPPSkeleton()
    if expand("%:p") =~? "usaco"
        silent 0read ~/.vim/skeletons/usaco.cpp
        silent :%s/<REPLACEME>/\=expand("%:t:r")/g
    else
        silent 0read ~/.vim/skeletons/standard.cpp
    endif
    normal G2k^
endfun

fun! CHeaderSkeleton()
    silent 0read ~/.vim/skeletons/c.h
    let l:filename = substitute(expand("%:t"), "\\W", "_", "g")
    let l:uuid =  matchstr(system("uuidgen"), "\\w*")
    silent :%s/<REPLACEME>/\=toupper(filename . "_" . uuid)/g
    normal G3k^
endfun

fun! SaveAsSudo()
    silent :w !sudo tee %
    silent :e!
    " TODO: Make it show normal output shown on :w
endfun

fun! MakeNoEnter()
    silent :make
    redraw!
endfun

fun! KexHighlight()
    normal! gvy
    let @0 = system('~/Dropbox/Studie/Kurser/Datalogi/Speciale/thesis/tools/syntax_latex', @0)
endfun

vmap <F11> :call KexHighlight()<CR>

fun! SetTexMakeprg()
    if (expand('%:p') =~? "DIKURevy-repo") || (! filereadable('Makefile'))
        setlocal makeprg=pdflatex\ --shell-escape\ '%'
    endif
endfun
" }}}
" Plugin settings {{{
" Textobj {{{
let g:Textobj_regex_enable = 1
let g:Textobj_fold_enable = 1
let g:Textobj_arg_enable = 1
" }}}
" Foldtext {{{
let g:Foldtext_enable = 1
let g:Foldtext_tex_enable = 1
let g:Foldtext_cpp_enable = 1
let g:Foldtext_perl_enable = 1
" }}}
" Python highlighting {{{
let python_highlight_all = 1
" }}}
" haskell {{{
" haskell-mode
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/lynx"
" ghc-mod
autocmd BufWritePost *.hs GhcModCheckAndLintAsync
hi ghcmodType ctermbg=green ctermfg=black
let g:ghcmod_type_highlight = 'ghcmodType'
let g:syntastic_haskell_checkers=['']
" }}}
" syntastic {{{
" let's get a bit less pylint, please
let g:syntastic_python_checkers = ['python']
" }}}
" }}}
" Finalization {{{
" Disable filetype-based indentation. It usually works really poorly.
filetype indent off
" }}}
