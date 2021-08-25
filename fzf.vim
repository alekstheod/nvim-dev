let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs'

command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --no-ignore-vcs --no-heading --color=always --smart-case -- '.<q-args>, 1,
			\   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --no-ignore-vcs --line-number --no-heading --color=always --smart-case -- %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

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
nnoremap <leader><leader> :Files<CR>
nnoremap <leader>f :RG <CR>
nnoremap <Tab> :Buffers<CR>

let $FZF_DEFAULT_OPTS = '--bind ctrl-space:toggle'

