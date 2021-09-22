" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " Ignore things we don't care about TODO revisit this)
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build\|dist'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " Ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif

" " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
"
"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"
"   " Ignore things we don't care about
"   set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"   let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
"
"   " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
"
"   " Ignore files in .gitignore
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" endif

" see recently opened files (in register)
nnoremap <leader>p :CtrlPBuffer<enter>

nnoremap <leader>* :Ag <cword> *<enter>

" Ingore case with lowercase searches
set ignorecase
set smartcase

" Keep undo history
set undofile
set undodir=~/.vimundo

" Color scheme
" set t_Co=256
set t_ut=
set background=dark
colorscheme gruvbox

" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>
"
" Run commands that require an interactive shell
" nnoremap <Leader>r :RunInInteractiveShell<space>

" more comfortable saving and quitting
nnoremap <Leader>w :w <ENTER>
nnoremap <Leader>q :q <ENTER>

" copy and paste with system keyboard
nnoremap <Leader>c "+y
nnoremap <Leader>v "+p

" Redraw the window in case it gets confused
nnoremap <Leader>r :redraw! <ENTER>

" Run Tests
autocmd FileType go nnoremap <Leader>t :GoTest <enter>
autocmd FileType ruby nnoremap <Leader>t :call RunNearestSpec()<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Toggle NERDTree with cril - n
nnoremap <C-n> :NERDTreeToggle<CR>
" Show hidden files in NerdTree
let NERDTreeShowHidden=1

" Escape without leaving the home row
imap jk <Esc>

let g:jsdoc_enable_es6=1

" enable JsDoc syntax highlighting via vim-javascript
let g:javascript_plugin_jsdoc=1

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Always use vertical diffs
set diffopt+=vertical

" Use system clipboard
set clipboard=unnamed

" Cop out: allow mouse
set mouse=a

" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = { 'javascript': ['prettier'] }
" let g:ale_fixers = { 'javascript': ['prettier', 'eslint'] }

" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction

" MACROS
let @k='oconsole.log(''%c{0}''.replace(''{0}'', ), ''background-color: black; color: white; font-size: 48px;'')==f)'

" Just :shrug:
let @s='o¯\_(ツ)_/¯==f)'

" Match Ruby do/end, etc
runtime macros/matchit.vim

" Vim-Go configuration
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_function = 1
let g:go_highlight_methods = 1
let g:go_fmt_command = "goimports"
" let g:ale_go_govet_lint_package = 1
let g:ale_linters = {'go': ['gometalinter', 'gofmt']}
