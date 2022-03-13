" .vimrc
" ----------------------------------------------------------------------------------------------
"
"   Author: ma-kappa
"   Description: Configuration file for vim.
"                Basic settings and customization by installing plugins.
"
"                Referenced in the creation
"                  https://dev.to/allanmacgregor/vim-is-the-perfect-ide-e80
"
" ----------------------------------------------------------------------------------------------

set nocompatible                " Vi incompatible mode.
syntax on                       " Color coding for each syntax.
set encoding=utf8               " Set default encoding UTF-8.

" --------------------------------------------------------------------------------
" Read Plugin
" Settings before Plugins loading
" File type settings should be turned off.
filetype off                    " required
" Load plugins managed by "vunlde.vim"
if filereadable(expand('~/dotfiles/.vimrc.vundle'))
  source ~/dotfiles/.vimrc.vundle
endif
" Settings after Plugins loading.
" File type, use indentation to match that file type
filetype plugin indent on       " required

" --------------------------------------------------------------------------------
" Basic settings
set number                        " Line number display
set ruler                         " Ruler display
set fenc=utf-8                    " Default file Encoding
set autoread                      " Automatic reading when editing others
set showcmd                       " Command string display
set whichwrap=b,s,h,l,<,>,[,]     " Keep cursor from stopping at the beginning or end of a line
set laststatus=2                  " Always display status line
set hidden                        " Allow opening other files while modifying
set showmatch                     " Display corresponding parentheses
set nobackup                      " Do not create backup file
set noswapfile                    " Do not create swap file
set visualbell t_vb=              " No beeping
set backspace=indent,eol,start    " Enable Backspace
set notitle                       " Title hidden
set cursorline                    " Highlight cursor line
set cursorcolumn                  " Highlight columns
set virtualedit=onemore           " Allow cursor to move to one end of line
set lazyredraw                    " Do not redraw while executing commands
set ttyfast                       " Make fast terminal connections
set clipboard+=unnamed            " Use the OS clipboard
set guioptions+=a                 " Show all menu bars, toolbars, and scrollbars
" Mouse settings on terminal
" Mouse mode (Normal:n, Visual mode:v, Insert mode:i, Command line mode:c, All:a)
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632') " I couldn't use has('mouse_sgr') :-(
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif

" --------------------------------------------------------------------------------
" Tab and indent settings
"set tabstop=4
"set shiftwidth=4
set smarttab
set expandtab                   " Insert spaces instead of tabs
set ambiwidth=double            " Let vim interpret full-width characters
set autoindent                  " Automatic indentation
set smartindent                 " Indent the new line the same amount as the current line when starting a new line.
set cindent                     " Start automatic indentation of C program files.
" Indent settings by file type
if has("autocmd")
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jsx        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go         setlocal noexpandtab list tabstop=2 shiftwidth=2
endif

" --------------------------------------------------------------------------------
" Search settings
set ignorecase                " Case insensitive
set smartcase                 " Distinguish between cases containing uppercase letters
set wrapscan                  " Go back to the beginning when you get to the end of the search.
set hlsearch                  " Highlight the characters you searched
set incsearch                 " Enable incremental search

" --------------------------------------------------------------------------------
" Color settings
" Color settings by terminal type
if &term =~ "xterm-256color" || "screen-256color"
  " 256 Colors
  set t_Co=256
  set background=dark
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif
" TrueColor
if (has("termguicolors"))
  set termguicolors
  " for tmux
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Color scheme
"colorscheme tender             " tender
"colorscheme lucario            " lucario
colorscheme zenburn           " Zenburn

" for MacVim
let macvim_skip_colorscheme=1

syntax enable                 " Enable syntax highlight

" --------------------------------------------------------------------------------
" Display settings
set laststatus=2                " Always display the status line
"set list listchars=tab:\-\>,eol:\￬,nbsp:%
set list                        " Enable Invisible Character display
set listchars=tab:>.,trail:_,extends:>,precedes:< " Invisible character display format
set display=uhex                " Non-printable characters in hexadecimal
" Display of full-width spaces
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
" Ruled only in the current window
augroup cch
autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
" Change cursor row (column) color when entering insert mode
"augroup vimrc_change_cursorline_color
"  autocmd!
"  autocmd InsertEnter * highlight CursorLine term=underline cterm=underline ctermbg=240 gui=underline guibg=#666666 | highlight CursorColumn ctermfg=231 ctermbg=31 gui=bold guifg=#ffffff guibg=#0087af
"  autocmd InsertLeave * highlight CursorLine term=underline cterm=underline ctermbg=235 gui=underline guibg=#333333 | highlight CursorColumn term=reverse ctermbg=235 guibg=#333333
"augroup END

" --------------------------------------------------------------------------------
" Customize keymap
nnoremap s <Nop>                            " Disabled for use as a Prefix key
" Cursor control
nnoremap j gj
nnoremap k gk
" Add mode after moving to the beginning of the line
inoremap <C-a> <Esc>^a
noremap <C-a> <Esc>^a
" Move to the end of the line and append mode
inoremap <C-e> <Esc>$a
noremap <C-e> <Esc>$a
" Tab and window settings
" Split window
nnoremap <silent>ss :split<CR>              " Horizontal
nnoremap <silent>sv :vsplit<CR>             " Vertical
nnoremap <silent>sc :close<CR>              " Close window
" Focus movement between split windows
nnoremap sj <C-w>j                          " Move down
nnoremap sk <C-w>k                          " Move up
nnoremap sl <C-w>l                          " Move right
nnoremap sh <C-w>h                          " Move left
nnoremap sw <C-w>w                          " Move next
" Movement of split window position
nnoremap sJ <C-w>J                          " Move down
nnoremap sK <C-w>K                          " Move up
nnoremap sL <C-w>L                          " Move right
nnoremap sH <C-w>H                          " Move left
nnoremap sr <C-w>r                          " Move rotation
" Window Size Adjustment
nnoremap s= <C-w>=                          " Align size
nnoremap s> <C-w>>                          " Increase width
nnoremap s< <C-w><                          " Decrease width
nnoremap s+ <C-w>+                          " Increase height
nnoremap s- <C-w>-                          " Decrease height
" Submode setting (continuous window size adjustment)
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
" Tab page settings
nnoremap tc :<C-u>tabnew<CR>                " Open new tab
nnoremap tn gt                              " Move to next tab page
nnoremap tp gT                              " Move to previous tab page


" --------------------------------------------------------------------------------
" (Plugin) Vim-Devicons
" GUI font settings
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
" Show folder icon
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" After a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
   call webdevicons#refresh()
endif

" --------------------------------------------------------------------------------
" (Plugin) Vim-Airline settings
set ttimeoutlen=50
" Set Airline theme
let g:airline_theme = 'zenburn'             " Color scheme
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" Separator used on left side
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
" Separator used on right side
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
" Indication that the file is encrypted
let g:airline_symbols.crypt = '🔒'
" Newline indication
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
" Maximum line
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
" Git branch name
let g:airline_symbols.branch = '⎇'
" Display paste mode
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'           " Spellcheck
let g:airline_symbols.notexists = '∄'       " If not managed by Git
let g:airline_symbols.whitespace = 'Ξ'      " Whitespace warnings (e.g., extra spaces)

" --------------------------------------------------------------------------------
" (Plugin) NEADTree settings
" Launch Shortcut Keys
" nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>
" Display the tree by default.
"let g:nerdtree_tabs_open_on_console_startup=1
" Hides the NERDTree if the file is specified, shows it if not specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" If NERDTree is open when all other buffers are closed, close NERDTree together.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&  b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden = 1          " Show hidden files
" (NERDTree-Git-Plugin)
" Display Git status
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" --------------------------------------------------------------------------------
" (Plugin) fugitive settings
" Display QuickFix List after executing grep search
autocmd QuickFixCmdPost *grep* cwindow
" Display the current git branch in the status line
set statusline+=%{fugitive#statusline()}

" --------------------------------------------------------------------------------
" (Plugin) Vim-Auto-Save settings
" Enable auto-save
let g:auto_save = 1                   " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1     " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0    " do not save while in insert mode

" --------------------------------------------------------------------------------
" Local-specific settings
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
