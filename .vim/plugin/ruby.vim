" Turn on syntax highlighting for ruby operators (==, ||, &&, etc)
let g:ruby_operators=1

au BufRead,BufNewFile *_test.rb noremap <buffer> <Leader>t :!testunit %<CR>
