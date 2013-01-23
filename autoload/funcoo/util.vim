" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:util         = {}
let s:util.clone   = function('copy')
let s:util.isEmpty = function('empty')
let s:util.size    = function('len')

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

function! s:util.uuid() abort "{{{
  return reltimestr(reltime())
endfunction
"}}}

let funcoo#util#module = s:util

if !exists('funcoo_debug') || !funcoo_debug
  lockvar funcoo#util#module
endif
