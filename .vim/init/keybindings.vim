" Keybindings
" -----------

let mapleader = ","
let maplocalleader = ";"

" Make Y consistent with D and C
map Y           y$

" Substitution
nmap <leader>s  :%s/
vmap <leader>s  :s/

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" Switch to alternate file
map <leader>e   :e#<CR>

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
