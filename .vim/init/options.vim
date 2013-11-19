set guifont=Inconsolata:h18
set guioptions-=T               " Remove GUI toolbar
set guioptions-=e               " Use text tab bar, not GUI
set guioptions-=rL              " Remove scrollbars
set guicursor=a:blinkon0        " Turn off the blinking cursor

set notimeout                   " No command timeout
set ttimeout ttimeoutlen=100    " But timeout on terminal escape codes, like arrow keys
set showcmd                     " Show typed command prefixes while waiting for operator
set mouse=a                     " Use mouse support in XTerm/iTerm.

set expandtab                   " Use soft tabs...
set tabstop=2                   " ...of 2 spaces.
set autoindent
set smarttab                    " Use shiftwidth to tab at line beginning
set shiftwidth=2                " Width of autoindent
set number                      " Line numbers
set nowrap                      " No wrapping
set backspace=indent,eol,start  " Let backspace work over anything.
set wildignore+=tags               " Ignore tags when globbing.
set wildignore+=tmp/**             " ...Also tmp files.
set wildignore+=public/uploads/**  " ...Also uploads.
set wildignore+=public/images/**   " ...Also images.
set wildignore+=vendor/**          " ...Also vendor.
set foldlevelstart=99           " By default, open files completely unfolded.

set list                        " Show whitespace
if has("gui_running")
  " NOCOMMIT
  set listchars=trail:·
else
  set listchars=trail:~
endif

set showmatch                   " Show matching brackets
set hidden                      " Allow hidden, unsaved buffers
set splitright                  " Add new windows towards the right...
set splitbelow                  " ...and bottom.
set wildmode=list:longest       " Bash/Zsh-like tab completion
set scrolloff=3                 " Scroll when the cursor is 3 lines from edge
set cursorline                  " Highlight current line

" More detailed status line
set statusline=[%n]\ %f\ %m\ %y
set statusline+=%{fugitive#statusline()} " Show git details"
set statusline+=%w              " [Preview]
set statusline+=%=              " Left/right separator
set statusline+=%c,             " Cursor column
set statusline+=%l/%L           " Cursor line/total lines
set statusline+=\ %P            " Percent through file

set laststatus=2                " Always show statusline

set incsearch                   " Incremental search
set history=1024                " History size
set ignorecase                  " Ignore case by default
set smartcase                   " Smart case-sensitivity when searching (overrides ignorecase)

set autoread                    " No prompt for file changes outside Vim

set swapfile                    " Keep swapfiles
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

set viminfo+=!                  " Save UPPERCASE globals in viminfo (useful for classpath.vim).

set hls                         " search with highlights by default

" Write all writeable buffers when changing buffers or losing focus.
set autowrite autowriteall       " Save when doing various buffer-switching things.
autocmd BufLeave * silent! wall  " Save anytime we leave a buffer.
