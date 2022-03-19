if exists('g:loaded_iseven') || &cp
  finish
endif

let g:loaded_iseven = '0.1.0' " version number
let s:keepcpo = &cpo
set cpo&vim

command! -nargs=1 IsEven :call iseven#Run(<f-args>)

let &cpo = s:keepcpo
unlet s:keepcpo
