" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:util          = funcoo#util#module
let s:list          = {}
let s:list.at       = function('get')
let s:list.concat   = function('extend')
let s:list.count    = function('count')
let s:list.index    = function('index')
let s:list.insert   = function('insert')
let s:list.join     = function('join')
let s:list.min      = function('min')
let s:list.max      = function('max')
let s:list.push     = function('add')
let s:list.range    = function('range')
let s:list.remove   = function('remove')
let s:list.reverse  = function('reverse')
let s:list.sort     = function('sort')
let s:list.times    = function('repeat')

function! s:list.clear(list) abort "{{{
  return s:list.filter(a:list, 0)
endfunction
"}}}

function! s:list.pop(list) abort "{{{
  return s:list.remove(a:list, -1)
endfunction
"}}}

let funcoo#list#module = s:list

if !exists('funcoo_debug') || !funcoo_debug
  lockvar funcoo#list#module
endif
