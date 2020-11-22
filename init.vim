" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'derekwyatt/vim-scala'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-emoji'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mxw/vim-jsx'
Plug 'neovimhaskell/haskell-vim'
Plug 'pangloss/vim-javascript'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
call plug#end()

" Key Bindings
""""""""""""""""
let mapleader = ","

" NERDTree
""""""""""""
map \  :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>
map <leader>f :FZF<CR>

" SuperTab
""""""""""""
" Pick completion type based on context
let g:SuperTabDefaultCompletionType = "context"

" Default completion type is user (aka completefunc)
let g:SuperTabContextDefaultCompletionType = "<c-x><c-u>"

" Always define completefunc based on omnifunc
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("context") |
  \ endif

" Color Schemes
"""""""""""""""""
let g:seoul256_background = 235
colo seoul256
