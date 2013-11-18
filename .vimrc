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
" come first or last, like bootstrapping Vim-Flavor.  Instead, add it to one
" of the files in .vim/init, or create a new one.


" Basic Setup
" -----------

set nocompatible                " Don't maintain compatibility with vi
execute pathogen#infect()
syntax on                       " Highlight known syntaxes
filetype plugin indent on       " Recognize filetypes


" Source initialization files
" ---------------------------

runtime! init/**.vim


" Enable Project-Specific .vimrcs
" -------------------------------

set exrc
set secure
