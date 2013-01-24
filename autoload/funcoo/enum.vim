" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:util = funcoo#util#module
let s:enum = {}

function! s:enum.each(iterator, thing, expression) abort "{{{
  if s:util.isFunction(a:expression)
    return a:iterator(a:thing, 'a:expression(v:val, v:key)')
  else
    return a:iterator(a:thing, a:expression)
  endif
endfunction
"}}}

function! s:enum.filter(thing, expression) abort "{{{
  return s:enum.each(function('filter'), a:thing, a:expression)
endfunction
"}}}

function! s:enum.map(thing, expression) abort "{{{
  return s:enum.each(function('map'), a:thing, a:expression)
endfunction
"}}}

let funcoo#enum#module = s:enum

if !exists('funcoo_debug') || !funcoo_debug
  lockvar funcoo#enum#module
endif
