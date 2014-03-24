if !has("gui_running")
  if &term =~ "^screen"
    " VT220-style function key codes.
    set <F13>=[25~
    set <F14>=[26~
    set <F15>=[28~
    set <F16>=[29~
    set <F17>=[31~
  elseif &term =~ "^xterm"
    set <F13>=[1;2P
    set <F14>=[1;2Q
    set <F15>=[1;2R
    set <F16>=[1;2S
    set <F17>=[15;2~
  endif

  " Map Cmd-S to <F12> in iTerm2 for Save.
  map <F12> :w\|wall<CR>
  map! <F12> <C-o>:w\|wall<CR>

  " Makes Command-T work again with arrow keys.  Not clear why.
  nmap <Esc>[A <Up>

  " Add a blank line when switching back from the altscreen.  Without this, we
  " often have the following situation:
  "
  " 1. User runs a shell command, which gives the prompt "Press ENTER or type
  "    command to continue".
  " 2. User presses enter, then runs another command which runs a shell
  "    command under :silent (such as fugitive-:Gcommit).
  " 3. The effect is that while the second command is executing, the user sees
  "    the non-alternate screen, including the "Press ENTER" prompt with the
  "    cursor at the end of it.  It appears as if the user should press ENTER.
  " 4. If the user does press ENTER, that keystroke applies after the command
  "    finishes executing.
  "
  " This at least moves the cursor off the prompt so the the user knows
  " better.
  let &t_te .= "\<C-M>\<C-J>"
end
