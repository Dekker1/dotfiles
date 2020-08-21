scriptencoding utf-8

let g:curmode={
	\ 'n'      : 'NORMAL ',
	\ 'no'     : 'N·OPERATOR PENDING ',
	\ 'v'      : 'VISUAL ',
	\ 'V'      : 'V·LINE ',
	\ "\<C-V>" : 'V·BLOCK ',
	\ 's'      : 'SELECT ',
	\ 'S'      : 'S·LINE ',
	\ "\<C-S>" : 'S·BLOCK ',
	\ 'i'      : 'INSERT ',
	\ 'R'      : 'REPLACE ',
	\ 'Rv'     : 'V·REPLACE ',
	\ 'c'      : 'COMMAND ',
	\ 'cv'     : 'VIM EX ',
	\ 'ce'     : 'EX ',
	\ 'r'      : 'PROMPT ',
	\ 'rm'     : 'MORE ',
	\ 'r?'     : 'CONFIRM ',
	\ '!'      : 'SHELL ',
	\ 't'      : 'TERMINAL '}

function! StatusLine() abort
	let l:line=''

	" help or man pages
	if &filetype ==# 'help' || &filetype ==# 'man'
		let l:line.=' %#StatusLineNC# ['. &filetype .'] %f '
		return l:line
	endif

	let l:line.='%1* %{g:curmode[mode()]}% '
	let l:line.='%3* %{GitBranch()}%  %4*'
	let l:line.=' %f %{ReadOnly()}% %{Modified()}% '
	let l:line.='%= '
  let l:line.=' %{LspStatus()}% '
	let l:line.='%3* Ln %l, Col %c %2* %{FileType()}%  '

	return l:line
endfunction

function! GitBranch()
	let l:command=''
	let l:command.="sh -c 'cd "
	let l:command.=SessionDir()
	let l:command.=" && git rev-parse --abbrev-ref HEAD'\n"
	return substitute(system(l:command), '\n', '', 'g')
endfunction

function! FileType() abort
	if len(&filetype) == 0
		return 'TEXT'
	endif

	return toupper(&filetype)
endfunction

function! SessionDir() abort
	if len(argv()) > 0
		return fnamemodify(argv()[0], ':p:h')
	endif

	return getcwd()
endfunction

function! ReadOnly() abort
	if !&modifiable && &readonly
		return '[RO] '
	elseif &modifiable && &readonly
		return '[RO] '
	elseif !&modifiable && !&readonly
		return ''
	else
		return ''
	endif
endfunction

function! LspStatus() abort
  let sl = ''
  let ec = luaeval("vim.lsp.util.buf_diagnostics_count(\"Error\")")
  if ec
    let sl.='⛔' . ec . ' '
  endif
  let wc = luaeval("vim.lsp.util.buf_diagnostics_count(\"Warning\")")
  if wc
    let sl.='⚡' . wc . ' '
  endif
  return sl
endfunction

function! Modified() abort
	if &modified
		return '[+] '
	else
		return ''
	endif
endfunction

highlight user1 ctermbg=1 guibg=#af4b57 ctermfg=0 guifg=#000000
highlight user2 ctermbg=1 guibg=#af4b57 ctermfg=0 guifg=#000000
highlight user3 ctermbg=8 guibg=#000000 ctermfg=NONE guifg=NONE
highlight user4 ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE
highlight group1 ctermbg=NONE ctermfg=0 guibg=NONE guifg=#000000

set statusline=%!StatusLine()
