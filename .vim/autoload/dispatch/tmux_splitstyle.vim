" dispatch.vim strategy: extends tmux to make :Start use a split.

if exists('g:autoloaded_dispatch_tmux_splitstyle')
  finish
endif
let g:autoloaded_dispatch_tmux_splitstyle = 1

function! dispatch#tmux_splitstyle#handle(request) abort
  if a:request.action ==# 'start' && !a:request.background
    let session = get(g:, 'tmux_session', '')
    if empty($TMUX) && empty(''.session) || !executable('tmux')
      return 0
    endif
    if !empty(system('tmux has-session -t '.shellescape(session))[0:-2])
      return ''
    endif

    let command = 'tmux split-window -l 10'
    let script  = dispatch#isolate(['TMUX', 'TMUX_PANE'], dispatch#prepare_start(a:request))
    let command .= ' ' . dispatch#shellescape('-P', '-t', session.':', 'exec ' . script)

    let g:debug = command
    call system(command)
    return 1
  else
    return 0
  endif
endfunction
