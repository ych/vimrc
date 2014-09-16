"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible			" Get out of VI's compatible mode
set autoindent				" Copy indent from current line when starting a new line
set autoread				" Set to auto read when a file is changed from the outside
set bg=dark				" Use {color} for the background
set enc=utf-8				" Default encoding
set tenc=utf-8				" Default term encoding
set fenc=utf-8				" Default file encoding
set fencs=utf-8,cp950,big5,euc-jp	" File encodings guess list
set exrc				" Include a .vimrc in the project's directory
set secure				" 避免執行現在目錄下 owner 不是自己的 .vimrc 之 autocmd
set showcmd				" See partial commands as you type
set showmatch				" Cursor shows matching ) and }
set showmode				" Show current mode
set number				" Show line number
set backspace=2				" Can use backspace
set history=500				" Set how many lines of history VIM have to remember
set t_Co=256				" Set number of colors
set ruler				" Show the cursor position all the time
set wildmenu				" Wild char completion menu
set smartcase				" Ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab				" Insert tabs on the start of a line according to context
set showfulltag				" Show full completion tags
set laststatus=2			" The last window will always have a status line
set cursorline				" Highlight the screen line of the cursor
set hlsearch				" search highlighting
set wildignore+=*.o,*.a,*.la,*.lo,*.so  " Files match with one of these patterns are ignored when completing names
"set list listchars=tab:»-,trail:·,extends:>

if has('cscope')
	set cscopetag

	if has('quickfix')
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif

	if filereadable("cscope.out")
		cscope add cscope.out
	endif

	set cscopeverbose
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme xorium
"colorscheme molokai
"colorscheme inkpot
"colorscheme zenburn
colorscheme yzlin256


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set map leader
let g:mapleader = ","

nmap <Leader>w :w!<CR>
nmap <Leader>q :q<CR>
nmap <Leader>p :set paste<CR>
nmap <Leader>c :!./configure<CR>
nmap <Leader>mn :set makeprg=make<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" Only for C
nmap <F9> :!ctags --languages=c -R --sort=yes --c-kinds=+lx --fields=+aS --extra=+q .<CR>
nmap <F6> :!find . -iname '*.[ch]' \| cscope -Rbq<CR>
" For C++ and C
"nmap <F9> :!ctags --languages=c,c++ -R --sort=yes --c++-kinds=+plx --c-kinds=+plx --fields=+iaS --extra=+q .<CR>
"nmap <F6> :!find . -iname '*.[ch]' -or -iname '*.[ch]pp' \| cscope -Rbq<CR>
" Auto complete
imap ,, <C-X><C-O>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:xml_syntax_folding=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileType                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au BufRead,BufNewFile *.go	setfiletype go
"autocmd FileType c,cpp,cc,h	set cindent
"autocmd FileType c		set omnifunc=ccomplete#Complete
let c_space_errors = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on				" syntax highlight


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug-in configuration                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	""""""""""""""""""""""""""""""
	" Vundle.vim
	" https://github.com/gmarik/Vundle.vim
	""""""""""""""""""""""""""""""
	Plugin 'gmarik/Vundle.vim'

	""""""""""""""""""""""""""""""
	" tagbar
	" https://github.com/majutsushi/tagbar
	""""""""""""""""""""""""""""""
	Plugin 'majutsushi/tagbar'
	nmap <F8> :TagbarToggle<CR>
	" set focus to TagBar when opening it
	let g:tagbar_autofocus = 1
	let g:tagbar_width = 25
	let g:tagbar_type_go = {
	    \ 'ctagstype' : 'go',
	    \ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	    \ ],
	    \ 'sro' : '.',
	    \ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	    \ },
	    \ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	    \ },
	    \ 'ctagsbin'  : 'gotags',
	    \ 'ctagsargs' : '-sort -silent'
	\ }

	""""""""""""""""""""""""""""""
	" nerdtree
	" https://github.com/scrooloose/nerdtree
	""""""""""""""""""""""""""""""
	Plugin 'scrooloose/nerdtree'
	nmap <F7> :NERDTreeToggle<CR>
	let g:NERDTreeWinSize = 25

	""""""""""""""""""""""""""""""
	" gundo
	" https://github.com/sjl/gundo.vim
	""""""""""""""""""""""""""""""
	Plugin 'sjl/gundo.vim'
	nmap <F5> :GundoToggle<CR>
	let g:gundo_right = 1
	let g:gundo_help = 0		" Set this to 0 to disable the help text in the Gundo graph window
	let g:gundo_close_on_revert = 1	" Set this to 1 to automatically close the Gundo windows when reverting
	let g:gundo_width = 25

	""""""""""""""""""""""""""""""
	" powerline
	" https://github.com/Lokaltog/powerline
	""""""""""""""""""""""""""""""
	Plugin 'Lokaltog/powerline'
	set rtp+=~/vimrc/.vim/bundle/powerline/powerline/bindings/vim
	
	""""""""""""""""""""""""""""""
	" YouCompleteMe
	" https://github.com/Valloric/YouCompleteMe
	""""""""""""""""""""""""""""""
	Plugin 'Valloric/YouCompleteMe'

	""""""""""""""""""""""""""""""
	" vim-go
	" https://github.com/fatih/vim-go
	""""""""""""""""""""""""""""""
	Plugin 'fatih/vim-go'
	let g:go_disable_autoinstall = 1

call vundle#end()
filetype plugin indent on
