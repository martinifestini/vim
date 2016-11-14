set wildmode=list:longest
set wildignore=*.pyc
set ts=4
set sw=4
set ls=2
set ai
set si
set incsearch
set expandtab
set number
set nowrap
set ruler
syntax on
set colorcolumn=80
" execute "set colorcolumn=" . join(range(81,335), ',')
set guioptions=egmt
set so=5
set lcs=tab:>-,trail:-
" maak hier ff GUI only regels van
" highlight guifg=gray
syntax on
filetype plugin indent on


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8.git'
Plugin 'pangloss/vim-javascript'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" hi ColorColumn guibg=gray ctermbg=gray
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

execute pathogen#infect()
set wrap
map <C-n> :NERDTreeToggle<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.git/*,WEB-INF/*,**/img/*,.git*,*.egg,*_components/**,*node_modules/**,build/**,env/**

let g:ctrlp_custom_ignore = '\v[\/](WEB-INF|env)$'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" CtrlP mappings

nmap <leader>lw :CtrlP<CR><C-\>w

cmap :tabl tabe<CR>:tabo<CR>

" Font

if has('gui_running')
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
endif

" Clearly this only works with airline enabled with powerline fonts
let g:airline_powerline_fonts = 1


" colorscheme github
colorscheme monokai-soda
set bg=dark

"  detect indent!
" autocmd BufReadPost * :DetectIndent
autocmd BufWritePost *.py call Flake8()
" let g:detectindent_preferred_expandtab = 1
"
