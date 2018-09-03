"https://resources.oreilly.com/examples/110000687/tree/master (mastering vim)

filetype plugin indent on

" Use tab width 2
set shiftwidth=2
set expandtab
set tabstop=2

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Lucious color scheme
colorscheme lucius
LuciusWhite

" Use arrow keys to navigate after a :vimgrep or :helpgrep
"nmap <silent> <RIGHT>         :cnext<CR>
"nmap <silent> <RIGHT><RIGHT>  :cnfile<CR><C-G>
"nmap <silent> <LEFT>          :cprev<CR>
"nmap <silent> <LEFT><LEFT>    :cpfile<CR><C-G>

"nmap <silent> <C-S-RIGHT>    :tabnext<CR>
"nmap <silent> <C-S-LEFT>     :tabprev<CR>
"nmap <silent> <C-S-UP>       :tabnew<CR>
"nmap <silent> <C-S-DOWN>     :tabclose<CR>
map <silent> <C-S-RIGHT>    <ESC><C-w>l
map <silent> <C-S-LEFT>     <ESC><C-w>h
map <silent> <C-S-UP>       <ESC>:vs<CR>
map <silent> <C-S-DOWN>     <ESC>:q<CR>

" Make :help appear in a full-screen tab, instead of a window
"Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction


" Turn on the ruler in the status line
set ruler


" Make % match angle brackets as well (including Euro-brackets)
set matchpairs+=<:>,«:»


" Allow deletes in Insert mode to keep deleting past the insertion point
set backspace=indent,eol,start


" Turn on case-insensitive matches (but only when pattern is all-lowercase)
set ignorecase smartcase


" Make searches look-ahead as you type
set incsearch


" Make successful searches highlight all possible matches
set hlsearch


" Make delete key in Normal mode remove the persistently highlighted matches
nmap <silent>  <BS>  :nohlsearch<CR>



" Set up persistent undo (with all undo files in one directory)
if has('persistent_undo')
    set undofile
endif

set undodir=$HOME/.VIM_UNDO_FILES

set undolevels=5000


" When completing, show all options, insert common prefix, then iterate
set wildmode=list:longest,full


" Make shift operations in Visual mode stay in Visual mode afterwards
vmap <expr> > ShiftAndKeepVisualSelection(">")
vmap <expr> < ShiftAndKeepVisualSelection("<")

function! ShiftAndKeepVisualSelection(cmd, mode)
    set nosmartindent
    if mode() =~ '[Vv]'
        return a:cmd . ":set smartindent\<CR>gv"
    else
        return a:cmd . ":set smartindent\<CR>"
    endif
endfunction


" Set up a permanent universal vertical marker after 80 columns
highlight ColorColumn ctermbg=magenta
set colorcolumn=81


" Highlight anything in the 81st column of long lines
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Fold lines according to the file's syntax
syntax enable
set foldmethod=syntax


" Fold lines for which the specified expression produces a fold-level
set foldexpr=strlen(matchstr(getline(v:lnum),'^-*'))
set foldmethod=expr


" Make folds auto-open and auto-close when the cursor moves over them
":set foldopen=all
":set foldclose=all


" Show/hide fold structure in the left margin
:set foldcolumn=6
:set foldcolumn&

