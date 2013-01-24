" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:util = funcoo#util#module
let s:dict = funcoo#dict#module

let s:object           = {}
let s:object.__super__ = 0

function! s:object.extend(...) dict abort "{{{
  let child              = a:0 ? a:1 : {}
  let extended           = s:dict.extend(child, self)
  let extended.__proto__ = s:util.clone(self.__proto__)
  let extended.__super__ = self.__proto__
  return extended
endfunction
"}}}

function! s:object.include(module) dict abort "{{{
  return s:dict.extend(self.__proto__, a:module)
endfunction
"}}}

function! s:object.new(...) dict abort "{{{
  let instance = s:util.clone(self.__proto__)
  let instance.__super__ = self.__super__
  call call(instance.constructor, a:000, instance)
  return instance
endfunction
"}}}

let s:proto            = {}
let s:object.__proto__ = s:proto

function! s:proto.constructor() dict abort "{{{
endfunction
"}}}

let funcoo#object#class  = s:object

if !exists('funcoo_debug') || !funcoo_debug
  lockvar s:proto
  lockvar s:object
endif
