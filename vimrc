call pathogen#runtime_append_all_bundles() "pathogen voor plugins
call pathogen#helptags() 		   "pathogen voor pathogen
"general
set number 		"regelnummers
syntax on 		"syntax highlighting
filetype on 		"filetype detection
set scrolloff=2   	"altijd laatste x regels laten zien
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
let mapleader = ","

