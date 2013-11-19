" Automatically close the Gundo windows when reverting.
let g:gundo_close_on_revert = 1

" Delete Gundo buffers when they're no longer being used.
" Otherwise, having 'hidden' on leaves this buffer around.
autocmd BufNewFile __Gundo_Preview__ set bufhidden=delete
