" ========================================================================
" Vundle
" ========================================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Utility
Plugin 'kien/ctrlp.vim'
Plugin 'tComment'
Plugin 'godlygeek/tabular'
Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'skalnik/vim-vroom'

" Rails
Plugin 'tpope/vim-rails.git'

" Rust
Plugin 'rust-lang/rust.vim'

" Python
Plugin 'vim-python/python-syntax'

" Javascript
Plugin 'pangloss/vim-javascript'

" JSX
Plugin 'mxw/vim-jsx'

" Elixir
Plugin 'elixir-lang/vim-elixir'

" Solidity
Plugin 'tomlion/vim-solidity'

" Go
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" ========================================================================
" Mappings
" ========================================================================

" Important
let mapleader = ','
:imap jj <ESC>

" Leader
map <Leader>ac :sp app/controllers/application_controller.rb<cr>
map <Leader>vc :Vcontroller<cr>
map <Leader>vm :Vmodel<cr>
map <Leader>vv :Vview<cr>
map <Leader>vu :AV<CR> " view unit test
map <Leader>vf :Vfunctional<cr>
map <Leader>bi :!bundle install<cr>
map <Leader>w <C-w>w " move vim window
map <Leader>sa mmggVG"*y`m " select all
map <Leader>f :call OpenFactoryFile()<CR>
map <Leader>i mmgg=G`m " indent, wow
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>cb :!cargo build<cr>
map <Leader>cr :!cargo run<cr>
map <Leader>mr :!mocha<cr>
map <leader>rb :!ruby %<cr>
map <Leader>rn :call RenameFile()<cr>
nmap <Leader>s :source ~/.vimrc<cr>
nnoremap <leader>p :set invpaste paste?<CR>

" ========================================================================
" Rename Current File (thanks Gary Bernhardt)
" ========================================================================

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! OpenFactoryFile()
  if filereadable("test/factories.rb")
    execute ":sp test/factories.rb"
  else
    execute ":sp spec/factories.rb"
  end
endfunction

" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=yellow

" ========================================================================
" Display
" ========================================================================

" Basic visual settings
syntax on
set autoindent
set background=dark
set backspace=2
set colorcolumn=100
set expandtab
set hlsearch
set number
set shiftwidth=2
set smartindent
set t_Co=256
set tabstop=2
set noeb vb t_vb=

" Handle ugly whitespace
" set list listchars=tab:>-,trail:•,precedes:<,extends:>
" set list listchars=trail:•
" set listchars=tab:␉·
"
" set tabstop=4 shiftwidth=4 expandtab

autocmd BufEnter *.go set ai sw=4 ts=4 sta et fo=croql

" Railscast theme
" colorscheme railscasts

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

" Cursor
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" enable status line always
set laststatus=2
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=226 ctermbg=232
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=232
endif

" $ lsof -wni tcp:3000
" $ kill -9 PID

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'

nmap <F5> <Esc>:w<CR>:!clear;python %<CR>
