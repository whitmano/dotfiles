" Olivia Whitman


" --- COlORS ---

colorscheme jellybeans " colorscheme for editor
syntax on " enable syntax highlighting

" --- TABS ---

set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces inserted for TAB when editing
set expandtab " translate TAB to spaces 

" --- UI CONFIG ---

set number " show line numbers
set showmatch " highlight matching parentheses and brackets - [{()}]

set foldenable " enable folding
set foldlevelstart=10 " open most folds by default, only code nested deeper than 10 will be folded
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level, great for python and other whitespace dependent languages

" --- SYNTAX COLORING ---

" Filetypes
augroup filetypedetect
        au! BufRead,BufNewFile *.vala,*.vapi setfiletype vala
augroup END

augroup vala
        autocmd BufRead *.vala,*.vapi set tw=100 efm=%f:%1.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
augroup END

