" ========================================================================
" I took some of this from Ben Orenstein (https://github.com/r00k/dotfiles)
" ========================================================================

" ========================================================================
" Vundle
" ========================================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails.git'
Plugin 'rust-lang/rust.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'skalnik/vim-vroom'
Plugin 'tComment'
Plugin 'godlygeek/tabular'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

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
nmap <Leader>s :source ~/.vimrc<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rename Current File (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>rn :call RenameFile()<cr>

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
set t_Co=256
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

" Paste-mode toggle
nnoremap <leader>p :set invpaste paste?<CR>

" $ lsof -wni tcp:3000
" $ kill -9 PID
