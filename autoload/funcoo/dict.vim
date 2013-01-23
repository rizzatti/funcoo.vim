" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let funcoo#dict#module = {}

function! funcoo#dict#module.clone(object) abort "{{{
  return copy(a:object)
endfunction
"}}}

function! funcoo#dict#module.extend(destination, ...) abort "{{{
  let extended = funcoo#clone(destination)
  for source in a:000
    call extend(extended, source)
  endfor
  return extended
endfunction
"}}}

lockvar funcoo#dict#module
