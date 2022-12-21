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
set mouse=v
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
set foldmethod=syntax
set nofoldenable
set foldlevel=1
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
" function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleCopyMode()
    if !exists('s:copy_mode')
        let s:copy_mode=0
    endif
    if(s:copy_mode == 0)
        let s:copy_mode=1
		set nonumber
		set norelativenumber
		set signcolumn=no
    else
        let s:copy_mode=0
		set number
		set relativenumber
		set signcolumn=yes
    endif
endfunction

nmap <leader>cp :call ToggleCopyMode()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" provider
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'inkarkat/vim-ingo-library', {'branch': 'stable'}
Plug 'inkarkat/vim-mark', {'branch': 'stable'}
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', {'do': './install --all --no-bash --no-fish --no-update-rc'}
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'kyazdani42/nvim-web-devicons' " optional for icon support
Plug 'tomasiser/vim-code-dark'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
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

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Remap keys for gotos
nmap <silent> <leader>gc <Plug>(coc-declaration)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gp :call CocAction('jumpDefinition', v:false)<CR>

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
            \'coc-lists',
            \'coc-git',
            \'coc-snippets',
            \'coc-clangd',
            \'coc-typos',
            \'coc-prettier',
            \'coc-jedi']

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

"plugset: tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_sort = 0
let g:tagbar_left = 0
let g:tagbar_ctags_bin = expand('~/bin/ctags')
noremap <F8> :TagbarToggle<CR>

"plugset: telescope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"lua require('telescope').load_extension('fzf')
