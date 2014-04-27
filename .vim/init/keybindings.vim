" Keybindings
" -----------

let mapleader = ","
let maplocalleader = ";"

" Easy writing.
nnoremap <Leader>w :w\|wall<CR>

" Make Y consistent with D and C
map Y           y$

" Substitution
nmap <leader>s  :%s/
vmap <leader>s  :s/
nmap <leader>S  :%S/
vmap <leader>S  :S/

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" Switch to alternate file
nmap <leader>e  :e #<CR>

" Make command-line mode shell-like:
"   C-A: To beginning of line
"   M-b: Back a word
"   M-f: Forward a word
cnoremap <C-A>  <C-B>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" But the default behavior of <C-A> is useful sometimes, so swap it into <C-B>
cnoremap <C-B>  <C-A>

" Disable F1
map <F1>        <Nop>
imap <F1>       <Nop>

" Recalculate diff when it gets messed up.
nmap du         :diffupdate<CR>

" Gundo.vim
map <leader>u   :GundoToggle<CR>

" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Commenting.
nmap <leader>/  gcc
vmap <leader>/  gc

" Directory browsing
nmap \          :e .<CR>
nmap \|         :e %:h<CR>

" Close quickfix window
nmap <leader>q  :cclose<CR>

" Dispatch.vim
nmap <leader><space> :Dispatch<CR>


let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <F13> :TmuxNavigateLeft<CR>
nnoremap <silent> <F14> :TmuxNavigateDown<CR>
nnoremap <silent> <F15> :TmuxNavigateUp<CR>
nnoremap <silent> <F16> :TmuxNavigateRight<CR>
nnoremap <silent> <F17> :TmuxNavigatePrevious<CR>

nnoremap <silent> <F18> :tabprevious<CR>
nnoremap <silent> <F19> :tabnext<CR>

" Don't type these in insert mode.
inoremap <silent> <F13> <Nop>
inoremap <silent> <F14> <Nop>
inoremap <silent> <F15> <Nop>
inoremap <silent> <F16> <Nop>
inoremap <silent> <F17> <Nop>
inoremap <silent> <F18> <Nop>
inoremap <silent> <F19> <Nop>

" vinegar.vim: Use split when directory browsing.
nmap - <Plug>VinegarSplitUp
