"pathogen plum
call pathogen#runtime_append_all_bundles() "pathogen voor plugins
call pathogen#helptags() 		   "pathogen voor pathogen

"GENERAL
"=======

set number 		"regelnummers
syntax on 		"syntax highlighting
filetype on 		"filetype detection
set scrolloff=2   	"altijd laatste x regels laten zien
colorscheme zwart       "ir_black colorschemes, zie :e $VIMRUNTIME/colors of :colo <c-d>
set guifont=monaco:h11  "font in gvim of macvim
"indentation
filetype indent on 	"filetype indentation
set nowrap
set autoindent 		"automatisch inspringen
set expandtab 		"spaces ipv tabs
set shiftwidth=4 	"hoeveel spaties bij autoindent
set softtabstop=4 	"hoeveel spaties bij Tab
"search
set hlsearch 		"highlight search
set incsearch 		"incremental search
set showmatch 		"bij zoeken matches weergeven
set smartcase 		"case bij zoeken
set ic                  "ignore case bij zoeken
set linebreak           "regel niet midden in woord afkappen


"KEY BINDINGS
"============

"leader key instellen
let mapleader = ","                             
"vimrc openen in nieuwe tab
map <leader>v :tabedit $MYVIMRC<CR>             
"alle vensters sluiten
map <leader>q :qall!<CR>                        
"search highlighting uitzetten
map <leader><space> :noh <CR>
"autoindent file, en terug naar laatste edit
map <leader>a gg=Gg, <CR>                       
"nerttree en tagbar openen
map <leader>l :NERDTreeToggle<CR> :TagbarToggle<CR>
"tussen vensters switchen
nnoremap <C-h> <C-w>h                           
nnoremap <C-j> <C-w>j                           
nnoremap <C-k> <C-w>k                           
nnoremap <C-l> <C-w>l                           
"edit mode verlaten bij jj
inoremap jj <ESC>                               
"nerdtree aan/uit
map <F2> <ESC>:NERDTreeToggle<CR>
"taglist aan/uit
map <F3> <ESC>:TlistToggle<CR>
"tagbar aan/uit
map <F4> <ESC>:TagbarToggle<CR>                 
"script 'run' uitvoeren
map <F5> <ESC>:w<CR>:!ctags -R *<CR>:!sh run<CR>
"tasklist aan/uit
map <F8> <ESC>:TaskList<CR>                     
"switch tussen source en header
autocmd FileType cpp map <F6> <ESC>:w<CR>:e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR> 
"F6 = serial monitor bij arduino
autocmd FileType arduino map <F6> <ESC>:!sh monitor<CR>
"Ctags php
autocmd FileType php map <F12> <ESC>:!ctags -f php.tags -R<CR>:set tags+=php.tags<CR>
"Ctags cpp
autocmd FileType cpp map <F12> <ESC>:!ctags -R --c++-kinds=+pl -f cpp.tags --fields=+iaS --extra=+q .<CR>:set tags +=cpp.tags<CR>
"ctags javascript (=jsctags zie doctorjs)
autocmd FileType javascript map <F12> <ESC>:!jsctags -f js.tags * <CR>:set tags +=js.tags<CR>

"FILES EN FILETYPES
"==================

"autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,longest
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"supertab
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"tern = javascript autocomplete
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

"bij .ino file filetype op arduino instellen
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino 
"na opslaan .vimrc automatisch laden
autocmd BufWritePost .vimrc source $MYVIMRC 
"format json met python tool
map <leader>j :%!python -m json.tool<CR>

"PLUGINS
"=======

"syntastic
let g:syntastic_auto_loc_list=1                 "automatisch error-lijst laten zien
let g:syntastic_enable_balloons=1               "markeert errors voor regelnummers
"geen syntax check bij html files (foutmeldingen lege tags)
let g:syntastic_mode_map={ 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html'] }
"Taglist aan de rechterkant
let Tlist_Use_Right_Window   = 1

"php mess detector
"autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/codesize.xml"
"autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/controversial.xml"
"autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/design.xml"
"autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/naming.xml"
"autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/unusedcode.xml"
