" Keybindings
" -----------

let mapleader = ","
let maplocalleader = ";"

" Easy writing.
nnoremap <Leader>w :w\|wall<CR>

" Make Y consistent with D and C
map Y           y$

" Yank to system pasteboard.
map <leader>y   "*y

" Substitution
nmap <leader>s  :%s/
vmap <leader>s  :s/
nmap <leader>S  :%S/
vmap <leader>S  :S/

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" Switch to alternate file
nnoremap <leader>e <C-^>

" Disable F1
map <F1> <Nop>
imap <F1> <Nop>

" Disable mouse scrolling
map <ScrollWheelUp> <Nop>
imap <ScrollWheelUp> <Nop>
map <ScrollWheelDown> <Nop>
imap <ScrollWheelDown> <Nop>

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

" Don't type these in insert-like modes.
noremap! <F13> <Nop>
noremap! <F14> <Nop>
noremap! <F15> <Nop>
noremap! <F16> <Nop>
noremap! <F17> <Nop>
noremap! <F18> <Nop>
noremap! <F19> <Nop>

" vinegar.vim: split-edit directory containing current file.
nmap _ <Plug>VinegarSplitUp

" Edit working directory
nmap <C-_> :e .<CR>

" Start an interactive console of some appropriate type. <Plug><Plug>Console
" is mapped in various filetypes to be something useful.
map <Leader>c <Plug><Plug>Console

" Useful default console.
noremap <Plug><Plug>Console :Start $SHELL<CR>

" Quickfix and Location List greps.
" Overridden where different greps are useful.
map <Leader>G <Plug><Plug>Grep
map <Leader>g <Plug><Plug>Lgrep

" Grep for word under cursor.
map <Leader><Leader>G <Plug><Plug>Grep<C-R><C-W><CR>
map <Leader><Leader>g <Plug><Plug>Lgrep<C-R><C-W><CR>

noremap <Plug><Plug>Grep :grep -w<Space>
noremap <Plug><Plug>Lgrep :lgrep -w<Space>
