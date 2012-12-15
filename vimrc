"pathogen plumrc openen in nieuwe tabmrc openen in nieuwe tabgin
call pathogen#runtime_append_all_bundles() "pathogen voor plugins
call pathogen#helptags() 		   "pathogen voor pathogen

"general
set number 		"regelnummers
syntax on 		"syntax highlighting
filetype on 		"filetype detection
set scrolloff=2   	"altijd laatste x regels laten zien
colorscheme peachpuff          "colorschemes, zie :e $VIMRUNTIME/colors

"indentation
filetype indent on 	"filetype indentation
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

"key bindings
let mapleader = ","                             "leader key instellen
map <leader>v :tabedit $MYVIMRC<CR>             "vimrc openen in nieuwe tab
map <leader>q :qall!<CR>                        "alle vensters sluiten
map <leader><space> :noh                        "search highlighting uitzetten
map <leader>a gg=Gg, <CR>                       "autoindent file, en terug naar laatste edit
nnoremap <C-h> <C-w>h                           "naar venster links
nnoremap <C-j> <C-w>j                           "naar venster beneden
nnoremap <C-k> <C-w>k                           "naar venster boven
nnoremap <C-l> <C-w>l                           "naar venster rechts
inoremap jj <ESC>                               "edit mode verlaten bij jj
map <F2> <ESC>:NERDTreeToggle<CR>               "nerdtree aan/uit
map <F3> <ESC>:TagbarToggle<CR>                 "tagbar aan/uit
map <F4> <ESC>:TaskList<CR>                     "tasklist aan/uit
map <F5> <ESC>:w<CR>:!ctags -R *<CR>:!sh run<CR>"script 'run' uitvoeren
autocmd FileType cpp map <F6> <ESC>:w<CR>:e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR> "switch tussen source en header
autocmd FileType arduino map <F6> <ESC>:!picocom $SERIALDEV<CR>
autocmd FileType php map <F12> <ESC>:!ctags -f php.tags --languages=PHP -R<CR>:set tags+=php.tags<CR>
autocmd FileType cpp map <F12> <ESC>:!ctags -R --c++-kinds=+pl -f cpp.tags --fields=+iaS --extra=+q .<CR>:set tags +=cpp.tags<CR>

"autocomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"files en filetypes
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino "bij .ino file filetype op arduino instellen
autocmd BufWritePost .vimrc source $MYVIMRC "na opslaan .vimrc automatisch laden

"PLUGIN syntastic
let g:syntastic_auto_loc_list=1                 "automatisch error-lijst laten zien
let g:syntastic_enable_balloons=1               "markeert errors voor regelnummers

"PLUGIN php mess detector
autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/codesize.xml"
autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/controversial.xml"
autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/design.xml"
autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/naming.xml"
autocmd BufNewFile,BufRead *.php let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.rulesets/unusedcode.xml"

