" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let funcoo#dict#module = {}

function! funcoo#dict#module.clone(object) abort dict "{{{
  return copy(a:object)
endfunction
"}}}

function! funcoo#dict#module.extend(destination, ...) abort dict "{{{
  let extended = self.clone(a:destination)
  for source in a:000
    call extend(extended, source)
  endfor
  return extended
endfunction
"}}}

function! funcoo#dict#module.uuid() dict abort "{{{
  return reltimestr(reltime())
endfunction
"}}}

if !exists('funcoo_debug') || !funcoo_debug
  lockvar funcoo#dict#module
endif
