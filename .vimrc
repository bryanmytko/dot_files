"Turn off vi compatibility
set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'
" Vroom (Rspec)
Plugin 'skalnik/vim-vroom'
" Ctrl P (Fuzzy Finder)
Plugin 'kien/ctrlp.vim'
" Vim Rails
Plugin 'tpope/vim-rails.git'
" Vim Ruby
Plugin 'vim-ruby/vim-ruby'
" TComment
Plugin 'tComment'
" Arduino
Plugin 'jplaut/vim-arduino-ino'
" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on

let g:vim_markdown_folding_disabled=1
:set syntax=markdown

" Basic visual settings
set t_Co=256
syntax on
set background=dark
set colorcolumn=80
set number
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set expandtab

set hlsearch

" Handle ugly whitespace
set list listchars=tab:>-,trail:•,precedes:<,extends:>

" Railscast theme
colorscheme railscasts

" Big remaps
let mapleader = ','
:imap jj <ESC>

" load indent file for the current filetype
" filetype indent on

" Bars
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=232
highlight Visual       ctermbg=240   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" first, enable status line always
set laststatus=2
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=226 ctermbg=232
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=232
endif

" Open Arduino Serial Monitor
let g:vim_arduino_auto_open_serial = 1

" Arduino Syntax
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
