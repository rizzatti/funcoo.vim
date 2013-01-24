" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:util          = funcoo#util#module
let s:dict          = {}
let s:dict.count    = function('count')
let s:dict.get      = function('get')
let s:dict.has      = function('has_key')
let s:dict.items    = function('items')
let s:dict.keys     = function('keys')
let s:dict.max      = function('max')
let s:dict.min      = function('min')
let s:dict.remove   = function('remove')
let s:dict.values   = function('values')

function! s:dict.extend(destination, ...) abort dict "{{{
  let last = a:000[a:0 - 1]
  let mode = s:util.isString(last) ? last : 'force'
  for source in a:000
    let extended = call extend(a:destination, source, mode)
  endfor
  return extended
endfunction
"}}}

let funcoo#dict#module = s:dict

if !exists('funcoo_debug') || !funcoo_debug
  lockvar funcoo#dict#module
endif
