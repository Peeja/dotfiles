" Insert ' => '
imap <buffer> <C-L> <Space>=><Space>

" Run RSpec.
nmap <buffer> <Leader>t :call RunCurrentSpecFile()<CR>
nmap <buffer> <Leader>T :call RunNearestSpec()<CR>
