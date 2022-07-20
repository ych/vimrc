"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" common
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype on
filetype plugin on
set noeb
syntax enable
syntax on
set t_Co=256
set showcmd
set ruler
set laststatus=2
set number
set relativenumber
set cursorline
set whichwrap+=<,>,h,l
set ttimeoutlen=0
set virtualedit=block,onemore
" set mouse=a
set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set cindent
set cinoptions=g0,:0,N-s,(0
set smartindent
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set backspace=2
set sidescroll=10
set nofoldenable
set wrap
set linebreak
set breakindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comlete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch
set ignorecase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cache
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set noswapfile
set autoread
set autowrite
set confirm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=en_US.UTF-8
set helplang=en
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,big5,cp950,ucs-bom,gbk,cp936,gb2312,gb18030,euc-jp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Locate to last position while open
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'inkarkat/vim-mark', {'branch': 'stable'}
Plug 'majutsushi/tagbar'
Plug 'tomasiser/vim-code-dark'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"plugset : vim-code-dark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme codedark

"plugset : coc.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_disable_startup_warning=1
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_global_extensions =[
            \'coc-pairs',
            \'coc-json',
            \'coc-python',
            \'coc-lists',
            \'coc-git',
            \'coc-snippets',
            \'coc-clangd',
            \'coc-typos',
            \'coc-prettier']

"plugset: vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1"

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>p <Plug>AirlineSelectPrevTab
nmap <leader>0 <Plug>AirlineSelectNextTab

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"plugset: LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_ShortcutF = '<leader>ff' "find in current project directory
let g:Lf_ShortcutB = '<leader>fb'
let g:Lf_WindowHeight = 0.70
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh','.clangd', '.clangx'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_ShowRelativePath = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_ShowDevIcons = 1
let g:Lf_DevIconsFont = "DejaVuSansMono Nerd Font Mono"
let g:Lf_CacheDirectory = expand('~/')
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsGutentags = 1 "using gutentags

"plugset: vim-gutentags"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand(g:Lf_CacheDirectory.'\.LfCache\/gtags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_modules = []
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif
let g:gutentags_auto_add_gtags_cscope = 1
"let g:gutentags_trace = 1

"plugset: gutentags_plus"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_plus_switch = 1
let g:gutentags_plus_nomap = 1
noremap <silent> <leader>gf :GscopeFind s <C-R><C-W><cr>   "Find symbol(reference) under cursor"
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>   "Find symbol definition under cursor"

"plugset: tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_sort = 0
let g:tagbar_left = 0
noremap <F8> :TagbarToggle<CR>
