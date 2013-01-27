" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:module = {}

function! s:module.isDict(item) abort "{{{
  return type(a:item) == type({})
endfunction
"}}}

function! s:module.isFloat(item) abort "{{{
  return type(a:item) == type(0.0)
endfunction
"}}}

function! s:module.isFunction(item) abort "{{{
  return type(a:item) == type(function('tr'))
endfunction
"}}}

function! s:module.isList(item) abort "{{{
  return type(a:item) == type([])
endfunction
"}}}

function! s:module.isNumber(item) abort "{{{
  return type(a:item) == type(0)
endfunction
"}}}

function! s:module.isObject(item) abort "{{{
  return s:module.isDict(a:item) && exists('a:item["__super__"]')
endfunction
"}}}

function! s:module.isString(item) abort "{{{
  return type(a:item) == type('')
endfunction
"}}}

function! s:module.uuid() abort "{{{
  return reltimestr(reltime())
endfunction
"}}}

let funcoo#util#module = s:module

if !exists('funcoo_debug') || !funcoo_debug
  lockvar! funcoo#util#module
endif
