" Disable switchbuf while moving through the location list, since it doesn't
" make much sense to use it there.

map [l     :call <SID>without_switchbuf("\<Plug>unimpairedLPrevious")<CR>
map ]l     :call <SID>without_switchbuf("\<Plug>unimpairedLNext")<CR>
map [<C-l> :call <SID>without_switchbuf("\<Plug>unimpairedLPFile")<CR>
map ]<C-l> :call <SID>without_switchbuf("\<Plug>unimpairedLNFile")<CR>
map [L     :call <SID>without_switchbuf("\<Plug>unimpairedLFirst")<CR>
map ]L     :call <SID>without_switchbuf("\<Plug>unimpairedLLast")<CR>

function! s:without_switchbuf(cmd)
  let old_switchbuf = &switchbuf
  let &switchbuf = ''
  execute "normal ".a:cmd
  let &switchbuf = old_switchbuf
endfunction
