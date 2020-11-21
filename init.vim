" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
call plug#end()

let mapleader = ","

map \  :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>
map <leader>f :FZF<CR>
