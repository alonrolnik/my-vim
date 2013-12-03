"################### Pathogen #######################
filetype off
call pathogen#runtime_append_all_bundles()
Helptags
syntax on
filetype plugin indent on

"################ General ########################
set nocompatible
set modelines=0
set ts=4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set formatoptions=l
set lbr
set number
set gdefault
set listchars=tab:▸\ ,eol:¬
" Present a menu instead of dumb tab-completion for filenames
set wildmenu
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov
set ofu=syntaxcomplete#Complete
set guioptions-=t
set guioptions-=l
set guioptions-=r
set guioptions-=b
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=R
set guioptions-=B
set guioptions-=M
"set showtabline=2
set nobackup
set noswapfile
set virtualedit=block
set splitbelow
set splitright
" Change work directory
if getcwd() == $HOME
    cd $HOME/ws
endif

"################## Key Mapping #####################
nnoremap Y y$
nnoremap <leader><space> :noh<cr>
nnoremap / /\v
vnoremap / /\v
nnoremap j gj
nnoremap k gk
nnoremap <up> g<up>
nnoremap <down> g<down>
map <F8> :TlistToggle<CR>
"
"Show hidden chars
nmap <C-h> :set list!<CR>

" Map Ctrl-t to open a new editor tab, Ctrl-j and Ctrl-k for tab navigation
nmap <C-t> :tabnew<CR>
nmap <C-left> :tabprevious<CR>
nmap <C-right> :tabnext<CR>

noremap <C-a> ^
noremap <C-e> $
noremap <C-up> <C-u>
noremap <C-down> <C-d>
map <leader>ve :e $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>
" Resizing
map <silent> <A-S-left> <C-w><
map <silent> <A-S-down> <C-W>-
map <silent> <A-S-up> <C-W>+
map <silent> <A-S-right> <C-w>> 
" Moving between windows
map <silent> <A-left> <C-w><left>
map <silent> <A-down> <C-W><down>
map <silent> <A-up> <C-W><up>
map <silent> <A-right> <C-w><right> 
"################# Color and Font #######################
colo codeschool "jellybeans xoria256 molokai ir_black molokai  candycode molokai ir_black wombat 
set gfn=Droid\ Sans\ Mono\ Slashed\ For\ Powerline\ 11

"####################### NERDTree #######################
map <leader><leader>o :NERDTreeToggle<CR>
" returns true if is NERDTree open/active
function! rc:isNTOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! rc:syncTree()
  if &modifiable && rc:isNTOpen() && !rc:isNTFocused() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" returns true iff focused window is NERDTree window
function! rc:isNTFocused()     
  return -1 != match(expand('%'), 'NERD_Tree') 
endfunction 

let NERDTreeQuitOnOpen=1

autocmd BufEnter * call rc:syncTree()
let NERDTreeIgnore = ['\.pyc$', '\.orig$']	

"################### Activate Sytastic for python and ruby only ###
let g:syntastic_auto_loc_list=1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,W293,E302,E251,E203,E128,E231,E225,E123,E124,E127,E126,E241'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby', 'php', 'python', 'clojure', 'javascript'] }
let g:syntastic_javascript_checkers = ['jshint']

"###################### Python #################################
" Load run code plugin
let g:pymode_run_key = '<leader><leader>r'
let g:pydiction_location = '~/.vim/pydiction/complete-dict'
let g:flake8_ignore="E501,W293,E302,E251,E203,E128,E231,E225,E124,E127,E126,E241"
let g:pymode_lint_ignore = "E501,W293,E302,E251,E203,E128,E231,E225,E124,E127,E126,E241"
let g:gpicker_open_file_in_tabs = 1
let g:yankring_max_history = 10
let g:yankring_min_element_length = 2
let g:yankring_history_dir = '$HOME/.vim'
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
let g:pymode_rope_guess_project = 0
let g:pymode_folding = 0
" Load pylint code plugin
let g:pymode_lint = 0
" Check code every save
let g:pymode_lint_write = 0
" Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 0
" Show error message if cursor placed at the error line
let g:pymode_lint_message = 0
" Place error signs
let g:pymode_lint_signs = 0

"################### Rainbow Parentheses ############################
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

"################### Disable preview scratch window ################
set completeopt=longest,menuone,preview
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"############## Powerline location for vim ######################## 
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"############## Paredit ###########################################
let g:paredit_leader = '\'

"############# Vim gnome terminal cursor shape #######################
au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"    
au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
au VimEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"

au FileType clojure let loaded_delimitMate = 0

nmap gV `[v`]

"############## ctrlP ###########################################
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|orig)$'
            \ }

noremap <silent> <C-Tab> :Bufferlist<CR>
let g:yankring_replace_n_nkey = '<m-n>'
let g:jedi#use_tabs_not_buffers = 0
