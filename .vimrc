"---------------Vundle--------------------"
so ~/.vim/plugins.vim

"-------------General Settings--------------"
syntax enable
set backspace=indent,eol,start      "Make backspace behave like every other editor.
let mapleader = ',' 	            "The default leader is \, but a comma is much better.
set number		                    "Let's activate line numbers.
set autowriteall                    "Automatically write the file when switching buffers.
set complete=.,w,b,u                "Set our desired autocompletion matching.set
set backupdir=~/vimtmp,.            "Change directory of backup files
set directory=~/vimtmp,.
set wildignorecase                  "Ignore case when autocompleting file names
filetype plugin on
set nowritebackup

"--------------Formatting----------"
set nowrap                          " wrap long lines
set autoindent                      " indent at the same level of the previous line
set copyindent                      " copy the previous indent
set expandtab                       " tabs are spaces, not tabs
set shiftwidth=4                    " use indents of 4 spaces
set tabstop=4                       " an indentation every four columns
set softtabstop=4                   " let backspace delete indent
set clipboard+=unnamedplus
set ignorecase                      " ignore case when searching
set smartcase                       " ignore case if search pattern is all lowercase,

"--------------Visuals-------------"
set background=dark
set t_Co=256
colorscheme hybrid
set cursorline                      " highlight current line

set guioptions-=l
set guioptions-=r

"-------------Search--------------"
set hlsearch
set incsearch


"-------------Split Management--------------"
set splitbelow
set splitright

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"-------------Mappings--------------"

"Easy escaping to normal mode
imap jj <esc>

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit ~/.vimrc<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>
nmap <Leader>pi :PluginInstall<cr>
nmap <Leader>pu :PluginUpdate<cr>

"Compile C file and run
map  <Leader>cc :w<cr>:!gcc % && ./a.out<cr>

"Shortcut for saving file
nmap <Leader>w :w<cr>

"Toggle NERDTree File Tree
nmap <c-B> :NERDTreeToggle<cr>

nmap <c-R> :CtrlPBufTag<cr>
nmap <c-E> :CtrlPMRUFiles<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Quickly jump to line number by pressing number and enter
:nnoremap <CR> G

"Quickly run PHPUnit test for the currently open file
map <Leader>pu :w<cr>:!vendor/bin/phpunit %<cr>

"-------------Plugins--------------"
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window  = 'top,order:ttb,min:1,max:30,results:30'

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>pd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
""/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

"/
""/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"/
""/ vim-closetag
"/
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php"


"-------------Auto-Commands--------------"

"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
        autocmd BufWritePost $MYVIMRC source %
augroup END

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

function! PhpSyntaxOverride()
     hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
