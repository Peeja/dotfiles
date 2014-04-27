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

" Disable F1
map <F1>        <Nop>
imap <F1>       <Nop>

" Common scenario: Press <S-V> to enter visual mode, then <K> to go up, but fail
" to release Shift before hitting <K>, which runs 'keywordprg' with the visual
" selection. Since I never use K from visual mode (and rarely use it at all),
" this mapping saves some hassle.
vmap K          k

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

" vinegar.vim: split-edit directory containing current file.
nmap _ <Plug>VinegarSplitUp

" Edit working directory
nmap <C-_> :e .<CR>
