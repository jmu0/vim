"pathogen plum
filetype off "vim system-vimrc sometimes sets filetype on, required by pathogen
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
set tabstop=4
"search
set hlsearch 		"highlight search
set incsearch 		"incremental search
set showmatch 		"bij zoeken matches weergeven
set smartcase 		"case bij zoeken
set ic                  "ignore case bij zoeken
set linebreak           "regel niet midden in woord afkappen
set fdm=syntax          "code folding syntax (zc=close, zo=open)"
set foldlevelstart=20   "all olds open "


"KEY BINDINGS
"============

"leader key instellen
let mapleader = ","                             
"vimrc openen in nieuwe tab
map <leader>v :tabedit $MYVIMRC<CR>             
"alle vensters sluiten
map <leader>q :qall!<CR>                        
"search highlighting uitzetten
map <leader><space> :noh <CR> :pclose <CR>
"autoindent file, en terug naar laatste edit
"ZIE ONDER beatify functies  map <leader>a gg=Gg, <CR>                       
"nerttree en tagbar openen
map <leader>l :NERDTreeToggle<CR> :TagbarToggle<CR>
" todo list recursive weergeven
map <leader>T :grep -rn TODO * <CR> :copen <CR> <C-W>K
"fuzzyfinder file mode
map <leader>f :FufFile <CR>
"tcomment
nmap <leader>c gcc
vmap <leader>c gc
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
"terndef
autocmd FileType javascript map <leader>d :TernDef<CR>
"python jump to definition
autocmd FileType python map <leader>d <C-c>g
"php
autocmd FileType php map <leader>d <C-]>
"switch tussen source en header
autocmd FileType cpp map <F6> <ESC>:w<CR>:e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR> 
"F6 = serial monitor bij arduino
autocmd FileType arduino map <F6> <ESC>:!sh monitor<CR>
"Ctags php
autocmd FileType php map <F12> <ESC>:!ctags -f php.tags -R<CR>:set tags+=.php.tags<CR>
autocmd FileType php set tags=.php.tags
"Ctags cpp
autocmd FileType cpp map <F12> <ESC>:!ctags -R --c++-kinds=+pl -f cpp.tags --fields=+iaS --extra=+q .<CR>:set tags +=cpp.tags<CR>
"ctags javascript (=jsctags zie doctorjs)
autocmd FileType javascript map <F12> <ESC>:!jsctags -f js.tags * <CR>:set tags +=js.tags<CR>

"FILES EN FILETYPES
"==================

"autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,preview,noselect

"tip window sluiten bij beweging of uit insert mode
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"supertab
" let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"tern = javascript autocomplete
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
" let g:tern_show_signature_in_pum=1

"bij .ino file filetype op arduino instellen
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino 
"na opslaan .vimrc automatisch laden
autocmd BufWritePost .vimrc source $MYVIMRC 
"format 
autocmd FileType json noremap <leader>a :%!python -m json.tool<CR>
autocmd FileType javascript noremap <buffer>  <leader>a :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <leader>a :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <leader>a :call CSSBeautify()<cr>
autocmd FileTYpe php noremap <buffer> <leader>a gg=Gg, <CR>


"PLUGINS
"=======

"syntastic
let g:syntastic_auto_loc_list=1                 "automatisch error-lijst laten zien
let g:syntastic_enable_balloons=1               "markeert errors voor regelnummers
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

"geen syntax check bij html files (foutmeldingen lege tags)
let g:syntastic_mode_map={ 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html'] }
"Taglist aan de rechterkant
let Tlist_Use_Right_Window   = 1
"pymode
autocmd FileType python let g:pymode = 1
autocmd FileType python let g:pymode_options = 1
autocmd FileType python let g:pymode_options_max_line_length = 120
autocmd FileType python let g:pymode_lint_ignore = "E501,C901" 
"vim-go
autocmd FileType go noremap <leader>d :GoDef<cr>
autocmd FileType go noremap <leader>r :GoRun<cr>

"autocmd FileType python let g:pymode_run = 1
"php mess detector
"autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/codesize.xml"
"autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/controversial.xml"
"autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/design.xml"
"autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/naming.xml"
"autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/unusedcode.xml"
