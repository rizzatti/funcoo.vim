" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:util = {}

function! s:util.clone(item) abort "{{{
  return copy(a:item)
endfunction
"}}}

function! s:util.isEmpty(item) abort "{{{
  return empty(a:item)
endfunction
"}}}

function! s:util.isFloat(item) abort "{{{
  return type(a:item) == type(0.0)
endfunction
"}}}

function! s:util.isFunction(item) abort "{{{
  return type(a:item) == type(function('tr'))
endfunction
"}}}

function! s:util.isList(item) abort "{{{
  return type(a:item) == type([])
endfunction
"}}}

function! s:util.isDict(item) abort "{{{
  return type(a:item) == type({})
endfunction
"}}}

function! s:util.isNumber(item) abort "{{{
  return type(a:item) == type(0)
endfunction
"}}}

function! s:util.isString(item) abort "{{{
  return type(a:item) == type('')
endfunction
"}}}

function! s:util.size(item) abort "{{{
  return len(a:item)
endfunction
"}}}

function! s:util.uuid() abort "{{{
  return reltimestr(reltime())
endfunction
"}}}

let funcoo#util#module = s:util

if !exists('funcoo_debug') || !funcoo_debug
  lockvar funcoo#util#module
endif
