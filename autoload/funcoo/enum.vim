" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:util = funcoo#util#module
let s:list = funcoo#list#module
let s:enum = {}

function! s:enum.all(thing, function) abort "{{{
  if s:util.isList(a:thing)
    for index in s:list.range(s:util.size(a:thing))
      call a:function(a:thing[index], index) ? continue : return 0
    endfor
  elseif s:util.isDict(a:thing)
    for [key, value] in a:thing
      call a:function(value, key) ? continue : return 0
    endfor
  else
    return 0
  endif
  return 1
endfunction
"}}}

function! s:enum.any(thing, function) abort "{{{
  if s:util.isList(a:thing)
    for index in s:list.range(s:util.size(a:thing))
      call a:function(a:thing[index], index) ? return 1 : continue
    endfor
  elseif s:util.isDict(a:thing)
    for [key, value] in a:thing
      call a:function(value, key) ? return 1 : continue
    endfor
  else
    return 1
  endif
  return 0
endfunction
"}}}

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

function! s:enum.find(thing, function) abort "{{{
  if s:util.isList(a:thing)
    for index in s:list.range(s:util.size(a:thing))
      let value = a:thing[index]
      call a:function(value, index) ? return value : continue
    endfor
  elseif s:util.isDict(a:thing)
    for [key, value] in a:thing
      call a:function(value, key) ? return value : continue
    endfor
  endif
  return 0
endfunction
"}}}

function! s:enum.map(thing, expression) abort "{{{
  return s:enum.each(function('map'), a:thing, a:expression)
endfunction
"}}}

function! s:enum.none(thing, function) abort "{{{
  let count = 0
  if s:util.isList(a:thing)
    for index in s:list.range(s:util.size(a:thing))
      count += call a:function(a:thing[index], index) ? 1 : 0
      count ? return 0 : continue
    endfor
  elseif s:util.isDict(a:thing)
    for [key, value] in a:thing
      count += call a:function(value, key) ? 1 : 0
      count ? return 0 : continue
    endfor
  else
    return 0
  endif
  return 1
endfunction
"}}}

function! s:enum.one(thing, function) abort "{{{
  let count = 0
  if s:util.isList(a:thing)
    for index in s:list.range(s:util.size(a:thing))
      count += call a:function(a:thing[index], index) ? 1 : 0
      count > 1 ? return 0 : continue
    endfor
  elseif s:util.isDict(a:thing)
    for [key, value] in a:thing
      count += call a:function(value, key) ? 1 : 0
      count > 1 ? return 0 : continue
    endfor
  else
    return 0
  endif
  return count
endfunction
"}}}

function! s:enum.reduce(list, function, memo) abort "{{{
  let sum = memo
  for item in a:list
    let sum += a:function(sum, item)
  endfor
  return sum
endfunction
"}}}

" Scratching head? Worth it?
function! s:enum.reject(thing, expression) abort "{{{
  if s:util.isFunction(a:expression)
    let sandbox = {}
    function sandbox.negated(...)
      return ! call(a:expression, a:000)
    endfunction
    return s:enum.each(function('filter'), a:thing, sandbox.negated)
  else
    let negated = '!(' . s:util.toString(a:expression) . ')'
    return s:enum.each(function('filter'), a:thing, negated)
  endif
endfunction
"}}}

let funcoo#enum#module = s:enum

if !exists('funcoo_debug') || !funcoo_debug
  lockvar funcoo#enum#module
endif
