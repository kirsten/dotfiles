call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-emoji'
Plug 'kien/rainbow_parentheses.vim'
Plug 'overcache/NeoSolarized'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
call plug#end()

set notimeout                   " No command timeout
set ttimeout                    " Add back a timeout for terminal vim
set ttimeoutlen=100             " Keep the timeout very short
set showcmd                     " Show typed command prefixes while waiting for operator
set mouse=a                     " Use mouse support in XTerm/iTerm.
set expandtab                   " Use soft tabs
set tabstop=2                   " Tab settings
set autoindent
set smarttab                    " Use shiftwidth to tab at line beginning
set shiftwidth=2                " Width of autoindent
set number                      " Line numbers
set nowrap                      " No wrapping
set backspace=indent,eol,start  " Let backspace work over anything.
set list                        " Show whitespace
set listchars=trail:·
set showmatch                   " Show matching brackets
set scrolloff=3                 " Scroll when the cursor is 3 lines from edge
set incsearch                   " Incremental search
set history=1024                " History size
set smartcase                   " Smart case-sensitivity when searching (overrides ignorecase)
set hls                         " search with highlights by default

" Key Bindings
" ------------

let mapleader = ","

" Gracefully handle holding shift too long after : for common commands
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev Tabe tabe
cabbrev Tabc tabc

"set pastetoggle keybinding
set pastetoggle=<F2>

" Make Y consistent with D and C
map Y           y$

" Search
nmap <leader>s  :%s/
vmap <leader>s  :s/

" Split screen
map <leader>v   :vsp<CR>

" Move between screens
map <leader>w   ^Ww
map <leader>=   ^W=
map <leader>j   ^Wj
map <leader>k   ^Wk
nmap <C-j>      <C-w>j
nmap <C-k>      <C-w>k
nmap <C-h>      <C-w>h
nmap <C-l>      <C-w>l

" Open init.vim file in new tab. Think Command + , [Preferences...] but with Shift.
map <D-<>       :tabedit ~/.config/nvim/init.vim<CR>

" Reload .vimrc
map <leader>rv  :source ~/.config/nvim/init.vim<CR>

" Auto-indent whole file
nmap <leader>=  gg=G``
map <silent> <F7> gg=G`` :delmarks z<CR>:echo "Reformatted."<CR>

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" File tree browser
map \           :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \|          :NERDTreeFind<CR>

" Previous/next quickfix file listings (e.g. search results)
map <M-D-Down>  :cn<CR>
map <M-D-Up>    :cp<CR>

" Previous/next quickfix file listings (e.g. search results)
map <M-D-Down>  :cn<CR>
map <M-D-Up>    :cp<CR>

" Open and close the quickfix window
map <leader>qo  :copen<CR>
map <leader>qc  :cclose<CR>

" Previous/next buffers
map <M-D-Left>  :bp<CR>
map <M-D-Right> :bn<CR>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" Git blame
map <leader>g   :Gblame<CR>

" Comment/uncomment lines
map <leader>/   <plug>NERDCommenterToggle

" In command-line mode, <C-A> should go to the front of the line, as in bash.
cmap <C-A> <C-B>

" Copy current file path to system pasteboard
map <leader>cp :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>cpl :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>

" Disable middle mouse button, F1
map <MiddleMouse>   <Nop>
imap <MiddleMouse>  <Nop>
map <F1>            <Nop>
imap <F1>           <Nop>

" FZF
map <leader>f :FZF<CR>
map <leader>a :Ag<CR>

" Prettier
map <leader>p :Prettier<CR>

" SuperTab
" --------
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

" Linting
" -------------
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\  'python': ['flake8', 'mypy'],
\  'ruby': ['rubocop'],
\  'javascript': ['eslint', 'standard', 'typescript'],
\ }

let g:ale_fixers = {
\  '*': ['trim_whitespace'],
\ }

let g:prettier#autoformat = 1

" Color Schemes
" -------------
" let g:seoul256_background = 235
" colo seoul256
set termguicolors
colorscheme NeoSolarized
