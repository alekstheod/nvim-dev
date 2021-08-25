if executable('clangd')
	augroup lsp_clangd
		autocmd!
		autocmd User lsp_setup call lsp#register_server({
					\ 'name': 'clangd',
					\ 'cmd': {server_info->['clangd']},
					\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
					\ })
		autocmd FileType c setlocal omnifunc=lsp#complete
		autocmd FileType cpp setlocal omnifunc=lsp#complete
		autocmd FileType objc setlocal omnifunc=lsp#complete
		autocmd FileType objcpp setlocal omnifunc=lsp#complete
	augroup end
endif

nmap <leader> gd :LspDefinition<CR>
set completeopt+=menuone
set completeopt+=noselect
set completeopt+=noinsert
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:deoplete#enable_at_startup = 1
autocmd VimEnter * call deoplete#custom#option({'max_list': 10})
let g:lsp_highlights_enabled = 0
let g:text_prop_enabled = 0
let g:virtual_text_enabled = 0

nmap <leader>gd <plug>(lsp-definition)
nmap <leader>gr <plug>(lsp-references)
nmap <leader>rn <plug>(lsp-rename)
