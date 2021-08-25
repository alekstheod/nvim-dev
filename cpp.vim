"Terdebug
packadd termdebug

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

function! EvalGdb()
	let selection = GetVisualSelection()
	let word = expand("<cword>")
	:call TermDebugSendCommand("print ".word)
endfunction

function! VEvalGdb()
	let word = GetVisualSelection()
	:call TermDebugSendCommand("print ".word)
endfunction

vnoremap <silent> ev :call VEvalGdb()<CR>

function! SetupGdb(...)
	:call TermDebugSendCommand("set confirm off")
	:call TermDebugSendCommand("set pretty on")
	:call TermDebugSendCommand("file ".a:1)
endfunction

let g:termdebug_useFloatingHover = 0

nnoremap <silent> ev :call EvalGdb()<CR>
autocmd filetype cpp nnoremap <F3>  :Termdebug %:r<CR><c-w>j<c-w>c<c-w>L
autocmd filetype cpp nnoremap <F4>	:call SetupGdb("test")<CR>
autocmd filetype cpp nnoremap <F5>	:Continue<CR>
autocmd filetype cpp nnoremap <F10> :Over<CR>
autocmd filetype cpp nnoremap <F11> :Step<CR>
autocmd filetype cpp nnoremap <kInsert> :Break<CR>
autocmd filetype cpp nnoremap <kDelete> :Clear<CR>
autocmd filetype cpp nnoremap <silent> so :Over<CR>
autocmd filetype cpp noremap <silent> si :Step<CR>
autocmd filetype cpp nnoremap <silent> co :Continue<CR>
autocmd filetype cpp nnoremap <silent> bp :Break<CR>

" cpp highlight config
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let c_no_curly_error=1

" copy paste cpp include
function! PasteInclude()
	let filename = getreg('i')
	:norm "ip
endfunction

function! CopyAsInclude()
	let file_path = expand('%')
	let include_path = '#include "'.file_path.'"'."\n"
	let @i=include_path
endfunction

function! AdaptFilePath(filepath, pattern, replacement)
    let index = strridx(a:filepath, a:pattern)
    if (index != -1)
        return a:filepath[0:index] . a:replacement
    endif
    return a:filepath
endfunction

function! AddIncludeImpl(filename)
	echo a:filename
	let include='#include "'.a:filename.'"'."\n"
	:call setreg('i', include)
	:norm "ip
endfunction

function! AddInclude()
	call fzf#run({'sink': function('AddIncludeImpl')})
endfunction

autocmd FileType cpp,c nnoremap <leader>ai :call AddInclude()<CR>
autocmd FileType cpp,c nnoremap <leader>th :call SwitchSourceHeader()<CR>
autocmd FileType cpp,c nnoremap <leader>ci :call CopyAsInclude()<CR>
autocmd FileType cpp,c nnoremap <leader>pi :call PasteInclude()<CR>

function! GoToError()
	let filename = getreg('+')
	let tokens = split(filename, ":")
    if (len(tokens) > 0)
		:exec 'edit' tokens[0]
    endif
    if (len(tokens) > 1 && matchstr(tokens[1], "[0-9][0-9]*") != "")
		:exec tokens[1]
    endif
    if (len(tokens) > 2 &&matchstr(tokens[1], "[0-9][0-9]*") != "")
		:exec 'norm' tokens[2]|
    endif
endfunction

autocmd FileType cpp,c nnoremap <leader>ge :call GoToError()<CR>

function! SwitchSourceHeader()
    let filepath = expand('%:p:h')
    let filename = expand("%:t:r")
    let fileending = expand("%:e")
    if (fileending == "cpp")
        let filetype = ".h"
        let filepath = AdaptFilePath(filepath, "/src", "includes/**")
        let filepath = AdaptFilePath(filepath, "/Sources", "Includes/**")
    endif
    if (fileending == "h")
        let filetype = ".cpp"
        let filepath = AdaptFilePath(filepath, "/includes", "src/**")
        let filepath = AdaptFilePath(filepath, "/Includes", "Sources/**")
    endif
    exe "find " . filepath . "/" . filename . filetype
endfunction
