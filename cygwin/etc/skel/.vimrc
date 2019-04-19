set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set nocp
set ru
syntax on  "语法高亮
set number  
set tabstop=4
set autoindent  "自动对齐
set shiftwidth=4
filetype on  "自动识别文件格式；
set showmatch
set matchtime=5
set cindent 
set hlsearch
set directory=$HOME/.vim/.swap//
set undodir=$HOME/.vim/.undo//
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
				  

"colorscheme desert
map <F12> :NERDTreeToggle<CR>
noremap <F9> :TlistToggle<CR>
"nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"
"nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-@>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>
"if has("cscope")
" 	set csprg=/usr/bin/cscope
"	set csto=0
"	set cst
"	set nocsverb
"	" add any database in current directory
"	if filereadable("cscope.out")
"		cs add cscope.out
"	" else add database pointed to by environment
"	elseif $CSCOPE_DB != ""
"		cs add $CSCOPE_DB
"	endif
"		set csverb
"endif


