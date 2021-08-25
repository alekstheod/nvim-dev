function! Touch()
	let result=system('touch '.expand("%"))
endfunction

nnoremap <c-\> :call Touch()<CR>

function! GetVisualSelection()
	" Why is this not a built-in Vim script function?!
	let [line_start, column_start] = getpos("'<")[1:2]
	let [line_end, column_end] = getpos("'>")[1:2]
	let lines = getline(line_start, line_end)
	if len(lines) == 0
		return ''
	endif
	let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
	let lines[0] = lines[0][column_start - 1:]
	return join(lines, "\n")
endfunction

"insert path
function! Paste(value)
	:call setreg('p', a:value)
	:norm "ppa
endfunction

function! InsertPath()
	call fzf#run({'sink': function('Paste')})
endfunction

imap <C-F> <ESC>:call InsertPath()<CR>

function! ExtractText(key, value)
	return a:value['text']
endfunction

function! PasteYankStack()
	let s:yankstack = map(g:Yankstack(), function('ExtractText'))
	call fzf#run(fzf#wrap({'source': s:yankstack, 'sink': function('Paste')}))
endfunction

imap <C-p> <ESC>:call PasteYankStack()<CR>
nnoremap <C-p> :call PasteYankStack()<CR>

function! DeleteBuffers(ext)
	let s:buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && bufname(v:val) =~ "\.'.a:ext.'$"')
	if empty(s:buffers) | throw "no *.".a:ext." buffer" | endif
	exe 'bd! '.join(s:buffers, ' ')
endfunction

command! -nargs=1 BD :call DeleteBuffers(<f-args>)

function! DeleteBuffersFzf()
	let s:bufnumbers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
	let s:buffers = map(s:bufnumbers, 'bufname(v:val)')
	call fzf#run(fzf#wrap({'source': s:buffers, 'options': '-m', 'sink': 'bd!'}))
endfunction
nmap <leader>bb :call DeleteBuffersFzf()<CR>
vmap <leader>bb :call DeleteBuffersFzf()<CR>
imap <leader>bb :call DeleteBuffersFzf()<CR>
