call plug#begin()

Plug 'gmarik/Vundle.vim'

Plug 'gruvbox-community/gruvbox'

" Utility
Plug 'kien/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'godlygeek/tabular'
Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'skalnik/vim-vroom'

" Rails
Plug 'tpope/vim-rails'

" Rust
Plug 'rust-lang/rust.vim'

" Python
Plug 'vim-python/python-syntax'

" Javascript
Plug 'pangloss/vim-javascript'

" JSX
Plug 'mxw/vim-jsx'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Solidity
Plug 'tomlion/vim-solidity'

" Go
Plug 'fatih/vim-go'

call plug#end()

let mapleader = ','
:imap jj <ESC>

map <Leader>rn :call RenameFile()<cr>
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
nmap <Leader>s :source ~/.vimrc<cr>                                                                 

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

hi MatchParen cterm=none ctermbg=black ctermfg=yellow

colorscheme gruvbox

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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
