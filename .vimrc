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

	Plug 'ludovicchabant/vim-gutentags'
	" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
	let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
	let g:gutentags_modules = []
	if executable('gtags-cscope') && executable('gtags')
		set cscopetag
		set cscopeprg=gtags-cscope
		set cscopeverbose
		let g:gutentags_modules += ['gtags_cscope']
	endif
	" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
	let g:gutentags_cache_dir = expand('~/.cache/tags')

	Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
	" don't show the help in normal mode
	let g:Lf_HideHelp = 1
	let g:Lf_UseCache = 0
	let g:Lf_UseVersionControlTool = 0
	let g:Lf_IgnoreCurrentBufferName = 1
	" popup mode
	let g:Lf_WindowPosition = 'popup'
	let g:Lf_PreviewInPopup = 1
	let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
	let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
	let g:Lf_ShortcutF = "<leader>ff"
	" should use `Leaderf gtags --update` first
	let g:Lf_GtagsAutoGenerate = 0
	"let g:Lf_Gtagslabel = 'native-pygments'

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

noremap <Leader>w :w!<CR>
noremap <Leader>q :q<CR>
noremap <Leader>p :set paste<CR>
noremap <Leader>fg :Leaderf gtags<CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

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

