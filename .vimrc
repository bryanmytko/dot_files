" Turn off vi compatibility
set nocompatible

" Vundle ----
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Language specific
Plugin 'vim-ruby/vim-ruby'
Plugin 'rust-lang/rust.vim'

Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'

Plugin 'skalnik/vim-vroom'
Plugin 'kien/ctrlp.vim'
Plugin 'tComment'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
" ---- Vundle

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

" remaps
let mapleader = ','
:imap jj <ESC>
:imap bbb binding.pry

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

set clipboard=unnamed
set backspace=2 " make backspace work like most other apps

:noremap <leader>gg y:Ggrep <c-r>"<cr>"
:noremap <leader><Space> zf
:noremap <leader>j 10j
:noremap <leader>k 10k

set foldenable
set foldmethod=manual
set foldlevel=1

" ridiculous macro for formatting Ruby hashes
:nnoremap <leader>fh $v%lohc<CR><CR><Up><C-r>"<Esc>:s/,/,\r/g<CR>:'[,']norm ==<CR>
