" Insert ' => '
imap <buffer> <C-L> <Space>=><Space>

" Run RSpec.
nmap <buffer> <Leader>t  :call RunCurrentSpecFile()<CR>
nmap <buffer> <Leader>T  :call RunNearestSpec()<CR>
nmap <buffer> <Leader>gt :call RunAllSpecs()<CR>

let b:surround_{char2nr("#")} = "#{\r}"

abbreviate <buffer> bbg byebug
abbreviate <buffer> bdp binding.pry
abbreviate <buffer> saop save_and_open_page
