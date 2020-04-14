" set colors for statusline based on mode
" these are based on the Nord colour scheme
function! ModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi fgc guifg=#d8dee9 guibg=#4c566a
    hi powerline guifg=#4c566a
    hi fgc_b guifg=#d8dee9 guibg=#4c566a
  " Insert mode || Replace mode
  elseif a:mode == 'i' || a:mode == 'R'
    hi fgc guifg=#4c566a guibg=#88c0d0
    hi powerline guifg=#88c0d0
    hi fgc_b guifg=#88c0d0 guibg=#4c566a
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == ""
    hi fgc guifg=#4c566a guibg=#ebcb8b
    hi powerline guifg=#ebcb8b
    hi fgc_b guifg=#ebcb8b guibg=#4c566a
  " Command mode || Terminal mode
  elseif a:mode == 'c' || a:mode == 't'
    hi fgc guifg=#4c566a guibg=#a3be8c
    hi powerline guifg=#a3be8c
    hi fgc_b guifg=#a3be8c guibg=#4c566a
  endif

  " entering and exiting out of goyo messes with this so I just set it every time
  hi powerline_b guifg=#4c566a guibg=NONE guisp=NONE gui=NONE cterm=NONE

  " Return empty string so as not to display anything in the statusline
  return ''
endfunction

" Return a nice mode name
function! ModeName(mode)
  if a:mode == 'n'
    return 'NORMAL'
  " Insert mode
  elseif a:mode == 'i'
    return 'INSERT'
  " Replace mode
  elseif a:mode == 'R'
    return 'REPLACE'
  " Visual mode
  elseif a:mode == 'v'
    return 'VISUAL'
  elseif a:mode == 'V'
    return "V-LINE"
  elseif a:mode == ""
    return "V-BLOCK"
  " Command mode
  elseif a:mode == 'c'
    return 'COMMAND'
  " Terminal mode
  elseif a:mode == 't'
    return 'TERMINAL'
  endif
endfunction

hi modified_powerline_b guifg=#2e3440 guibg=NONE
hi modified_fgc guifg=#2e3440 guibg=NONE
function! Modified(modified)
  if a:modified == 1
    hi modified_powerline_b guifg=#4c566a guibg=NONE
    hi modified_fgc guifg=#a3be8c guibg=#4c566a
  else
    hi modified_powerline_b guifg=#2e3440 guibg=NONE
    hi modified_fgc guifg=#2e3440 guibg=NONE
  endif
  return '●'
endfunction

function! BufNum()
  return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

set noshowmode
set laststatus=2
set statusline=

" Update colors when ya do
set statusline+=%{ModeColors(mode())}

" Mode
set statusline+=%#powerline#%#fgc#%{ModeName(mode())}%#powerline#
set statusline+=\ 

" Filename
set statusline+=%#powerline_b#%#fgc_b#%.20f%#powerline_b#
set statusline+=\ 

" Right Side
set statusline+=%=

" Modified 
set statusline+=%#modified_powerline_b#%#modified_fgc#%{Modified(&modified)}%#modified_powerline_b#
set statusline+=\ 

" Number of buffers
set statusline+=%#powerline#%#fgc#%{BufNum()}%#powerline#
