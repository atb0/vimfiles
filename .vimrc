set t_Co=256

" Turn off vi compatibility mode
set nocompatible
" Turn on syntax highlighting
syntax on
"Allow automatic identation for supported languages
set autoindent
" Free-moving cursor
set virtualedit=all
" Show line numbers on left
set number
" Highlight matching [](){}
set showmatch
" Adds matching of < with > to set
set matchpairs+=<:>
" Turn on utf-8/unicode encoding
set encoding=utf-8
" Turn off auto-backups
set nobackup
" set max command history to 100
set history=100

" Tabs **********************
function! Tabstyle_tabs()
" using 4 column tabs
	set softtabstop=4
	set shiftwidth=4
	set tabstop=4
	set noexpandtab
endfunction

" 2 Space Tab-style *********
function! Tabstyle_spaces()
" use 2 spaces
	set softtabstop=2
	set shiftwidth=2
	set tabstop=2
	set expandtab
endfunction

" Default Tab style (4 space)
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab
set shiftround

" Scroolbars/status *****************

set sidescrolloff=2
" top and bottom scrool off
set scrolloff=2

set title
set ruler
set showmode
set showcmd

" Bash tab style completion
set wildmode=longest,list
" wildchar-the char used for "expansion" on the command line default value is
" "<C-E>" but I prefer the tab key:
set wildchar=<TAB>
" ignore these files when completing
set wildignore=*~,#*#,*.sw?,*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db,*.class,*.java.html,*.cgi.html,*.html.html,.viminfo,*.pdf
 
 " shortmess: shorten messages where possible, especially to stop annoying
 " 'already open' messages!
 " set shortmess=atIAr
 set shortmess=flnrxoOItTA

 "Windows *******************
 " split below or right automatically
 set splitbelow splitright
 " Don't force equal sizing
 set noequalalways


 " Searching ********************
 " Highlight
 set hlsearch
 " Ignore case in search
 set ignorecase
 " Don't ignore case if uppercase in search
 set smartcase
 " Incremental searching
 set incsearch
 " Auto search/replace whole line
 set gdefault

 " Hide the mouse in terminal
 set mousehide

 " Colors *****************
 " Turn syntax highlighting on
syntax on
" Force dark background
set background=dark
" Set colorscheme
colorscheme xoria256


"completion
" Autocompletion tags for languages
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javasciptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Wrapping ***************************
" Turn wrapping off
set nowrap
" Allow linebreak at break character (not on)
set linebreak

" auto format comments at textwidth. :help fo-table for more
set formatoptions=cq
" max width for comments / if wrap enabled. 79 characters for PEP-8
set textwidth=79


" Filetypes ************************* (au = autocommand)
" Filetype equivalences for completion/tabbing
au BufNewFile,BufRead *.html setf xhtml
au BufNewFile,BufRead *.lzx setf lzx
au BufNewFile,BufRead *.module setf php
au BufNewFile,BufRead *.inc setf php
au BufNewFile,BufRead *.pl, *.pm, *.t setf perl

" c autoindent
au FileType c,cpp,slang set cindent
au FileType c set formatoptions+=ro

au FileType perl set smartindent
au FileType python set formatoptions-=t

" for CSS, also have things in braces indented:
au FileType css set smartindent
 
 " for HTML, generally format text, but if a long line has been created leave it
 " alone when editing:
 autocmd FileType xhtml set formatoptions+=l
 autocmd FileType xhtml set formatoptions-=t
 autocmd FileType djangohtml set formatoptions+=l
 autocmd FileType djangohtml set formatoptions-=t
  
  " Suffixes that get lower priority when doing tab completion for filenames.
  " These are files we are not likely to want to edit or read.
  set suffixes=.bak,~,.svn,.git,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
   
   "jump to last cursor position when opening a file
   "dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
     if &filetype !~ 'commit\c'
         if line("'\"") > 0 && line("'\"") <= line("$")
	      exe "normal g`\""
	 endif
end
endfunction

" aliases and key controls

" swap windows
nmap , <C-w><C-w>
 
 "move around windows with ctrl key!
 " Ctrl+w->h --Switch Window left
 map <C-H> <C-W>h
 " Ctrl+w->j --Switch Window down
 map <C-J> <C-W>j
 " Ctrl+w->k --Switch Window up
 map <C-K> <C-W>k
 " Ctrl+w->l --Switch Window right
 map <C-L> <C-W>l
  
"show indent settings
nmap \I :verbose set ai? cin? cink? cino? si? inde? indk? formatoptions?<CR>
 
 "replace all tabs with 4 spaces
" map \ft :%s/ / /g<CR>

"Filetype specific settings/functions


"Java
au BufRead,BufNewFile *.java set filetype=java
au FileType java call Tabstyle_spaces() 

" Individual filestypes->Tabstyle settings
"Python
au FileType python call Tabstyle_tabs()
"Ruby
au FileType ruby call Tabstyle_spaces()
"Lua
au FileType lua call Tabstyle_spaces()
"Perl
au FileType perl call Tabstyle_spaces()
"C
au FileType c call Tabstyle_spaces()
