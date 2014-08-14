" Turn off vi compatibility
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

call vundle#end()
filetype plugin indent on

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
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=232
" highlight IncSearch    ctermbg=240   ctermfg=232
" highlight Search       ctermbg=240   ctermfg=232
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

" ridiculous macro for formatting Ruby hashes
:nnoremap <leader>fh $v%lohc<CR><CR><Up><C-r>"<Esc>:s/,/,\r/g<CR>:'[,']norm ==<CR>
