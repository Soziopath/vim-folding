" The function is called for each line of code, numbers represent fold level
function! VimFolds()
  " get line contents
  let thisline = getline(v:lnum)
    if match(thisline, '^"""') >= 0
	    " tell Vim this line starts a level 2 fold, so Vim close all level 2 folds that came before it
    	return '>2'
	elseif match(thisline, '^""') >= 0
    	return '>1'
	else
		" tell Vim this line should have the same fold level as its predecessor
		return '='
	endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=VimFolds()
