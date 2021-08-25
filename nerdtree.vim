"Nerdtree
let g:NERDTreeWinPos = "right"
nnoremap <C-Space> :NERDTreeFind<CR>zz
inoremap <C-Space> <Esc>:NERDTreeFind<CR>zz
nnoremap <silent> nt :NERDTreeToggle<CR>
nnoremap <silent> ntf :NERDTreeFind<CR>zz

autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
autocmd BufWinEnter * call PreventBuffersInNERDTree()

function! PreventBuffersInNERDTree()
	if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
				\ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
				\ && &buftype == '' && !exists('g:launching_fzf')
		let bufnum = bufnr('%')
		close
		exe 'b ' . bufnum
		NERDTree
	endif
	if exists('g:launching_fzf') | unlet g:launching_fzf | endif
endfunction


nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
