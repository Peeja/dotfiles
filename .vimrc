" ----------
" Vim Config
" ----------
"
"
" How this works:
"
" This file is minimal.  Most of the vim settings and initialization is in
" several files in .vim/init.  This makes it easier to find things and to
" merge between branches and repos.
"
" Please do not add configuration to this file, unless it *really* needs to
" come first or last, like bootstrapping the bundle loader.  Instead, add it
" to one of the files in .vim/init, or create a new one.

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc()

NeoBundle "altercation/vim-colors-solarized"
NeoBundle "applescript.vim"
NeoBundle "christoomey/vim-tmux-navigator"
NeoBundle "duwanis/tomdoc.vim"
NeoBundle "godlygeek/tabular"
NeoBundle "guns/vim-clojure-static"
NeoBundle "guns/vim-sexp"
NeoBundle "kana/vim-textobj-user"
NeoBundle "kchmck/vim-coffee-script"
NeoBundle "kien/ctrlp.vim"
NeoBundle "kien/rainbow_parentheses.vim"
NeoBundle "matchit.zip"
NeoBundle "msanders/snipmate.vim"
NeoBundle "nelstrom/vim-textobj-rubyblock"
NeoBundle "netrw.vim"
NeoBundle "pangloss/vim-javascript"
NeoBundle "Peeja/vim-cdo"
NeoBundle "plasticboy/vim-markdown"
NeoBundle "regreplop.vim"
NeoBundle "scrooloose/syntastic"
NeoBundle "sjl/gundo.vim"
NeoBundle "thoughtbot/vim-rspec"
NeoBundle "tpope/vim-abolish"
NeoBundle "tpope/vim-afterimage"
NeoBundle "tpope/vim-bundler"
NeoBundle "tpope/vim-characterize"
NeoBundle "tpope/vim-commentary"
NeoBundle "tpope/vim-cucumber"
NeoBundle "tpope/vim-dispatch"
NeoBundle "tpope/vim-endwise"
NeoBundle "tpope/vim-eunuch"
NeoBundle "tpope/vim-fireplace"
NeoBundle "tpope/vim-fugitive"
NeoBundle "tpope/vim-haml"
NeoBundle "tpope/vim-jdaddy"
NeoBundle "tpope/vim-liquid"
NeoBundle "tpope/vim-obsession"
NeoBundle "tpope/vim-rails"
NeoBundle "tpope/vim-rake"
NeoBundle "tpope/vim-repeat"
NeoBundle "tpope/vim-sexp-mappings-for-regular-people"
NeoBundle "tpope/vim-speeddating"
NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-unimpaired"
NeoBundle "tpope/vim-vinegar"
NeoBundle "vim-ruby/vim-ruby"

NeoBundleCheck

syntax on                       " Highlight known syntaxes
filetype plugin indent on       " Recognize filetypes


" Source initialization files
" ---------------------------

runtime! init/**.vim
