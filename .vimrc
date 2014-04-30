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
set relativenumber
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
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F8> :TlistToggle<CR>
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

" yank
map Y y
"################# Color and Font #######################
set background=dark
colo molokai "jellyx clouds_midnight lucius solarized ir_black xoria256 ir_black molokai  candycode molokai ir_black wombat 
set gfn=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 11

"####################### NERDTree #######################
let NERDTreeIgnore = ['\.pyc$', '\.orig$']	
let NERDTreeQuitOnOpen=1

" returns true if is NERDTree open/active
function! rc:isNTOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! rc:ImprovedToggle()
    if rc:isNTOpen()
        NERDTreeClose
    else
        NERDTreeFind
    endif
endfunction

map <leader><leader>o :call rc:ImprovedToggle()<CR>

"autocmd BufEnter * call rc:syncTree()

"################### Activate Sytastic for python and ruby only ###
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby', 'php', 'python', 'clojure', 'javascript'] }
let g:syntastic_auto_loc_list=1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_flake8_args='--ignore=E501,W293,E302,E251,E203,E128,E231,E225,E123,E124,E127,E126,E241'

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


"############## AirLine ###########################################
let g:airline_powerline_fonts = 1
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
"
"################BufExplorer#####################################
let g:bufExplorerShowNoName=1        " Show 'No Name' buffers.
let g:bufExplorerSplitBelow=0        " Split new window above current.
"let g:bufExplorerVertSize=n          " New split window is n columns wide.

"##############Jedi Vim##########################################
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = "0"
