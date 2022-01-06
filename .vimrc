"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug-in configuration                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
call plug#begin('~/.vim/plugged')

	Plug 'scrooloose/nerdtree'
	nmap <F7> :NERDTreeToggle<CR>
	let g:NERDTreeWinSize = 25

	Plug 'scrooloose/nerdcommenter'

	Plug 'sjl/gundo.vim'
	nmap <F5> :GundoToggle<CR>
	let g:gundo_right = 1
	let g:gundo_help = 0		" Set this to 0 to disable the help text in the Gundo graph window
	let g:gundo_close_on_revert = 1	" Set this to 1 to automatically close the Gundo windows when reverting
	let g:gundo_width = 50
	let g:gundo_prefer_python3 = 1

	Plug 'Yggdroot/indentLine'
	let g:indentLine_enabled = 1
	let g:indent_guides_guide_size = 1  " 指定对齐线的尺寸
	let g:indent_guides_start_level = 2  " 从第二层开始可视化显示缩进

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'itchyny/lightline.vim'

	Plug 'tomasiser/vim-code-dark'

	Plug 'inkarkat/vim-mark'

	Plug 'editorconfig/editorconfig-vim'

call plug#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible				" Get out of VI's compatible mode
set autoindent					" Copy indent from current line when starting a new line
set autoread					" Set to auto read when a file is changed from the outside
set bg=dark					" Use {color} for the background
set enc=utf-8					" Default encoding
set tenc=utf-8					" Default term encoding
set fenc=utf-8					" Default file encoding
set fencs=utf-8,gb2312,cp950,big5,euc-jp	" File encodings guess list
set exrc					" Include a .vimrc in the project's directory
set secure					" 避免執行現在目錄下 owner 不是自己的 .vimrc 之 autocmd
set showcmd					" See partial commands as you type
set showmatch					" Cursor shows matching ) and }
set showmode					" Show current mode
set number					" Show line number
set backspace=2					" Can use backspace
set history=500					" Set how many lines of history VIM have to remember
set t_Co=256					" Set number of colors
set ruler					" Show the cursor position all the time
set wildmenu					" Wild char completion menu
set smartcase					" Ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab					" Insert tabs on the start of a line according to context
set showfulltag					" Show full completion tags
set laststatus=2				" The last window will always have a status line
set cursorline					" Highlight the screen line of the cursor
set hlsearch					" search highlighting
set wildignore+=*.o,*.a,*.la,*.lo,*.so,*.pyc  	" Files match with one of these patterns are ignored when completing names
set visualbell					" Vim will flash its screen instead of sounding a beep
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set cursorline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
colorscheme codedark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set map leader
let g:mapleader = ","

nmap <Leader>w :w!<CR>
nmap <Leader>q :q<CR>
nmap <Leader>p :set paste<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax
set foldlevelstart=1
let g:xml_syntax_folding=1
let g:c_syntax_folding=1
let g:cpp_syntax_folding=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileType                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:c_space_errors = 1
let g:cpp_space_errors = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on				" syntax highlight

