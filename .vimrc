" Turn off vi compatibility
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails.git'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kien/ctrlp.vim'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-dispatch'

call vundle#end()
filetype plugin indent on

set t_Co=256
syntax on
set background=dark
colorscheme railscasts

set hlsearch
set number
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set expandtab
set colorcolumn=80

:imap jj <ESC>

let mapleader=","

" load indent file for the current filetype
filetype indent on

set list listchars=tab:>-,trail:•,precedes:<,extends:>

highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=232
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=240   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1

" first, enable status line always
set laststatus=2
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=226 ctermbg=232
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=232
endif
