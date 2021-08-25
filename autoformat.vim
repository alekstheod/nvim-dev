au BufWrite * :Autoformat
function! Touch()
	let result=system('touch '.expand("%"))
endfunction
