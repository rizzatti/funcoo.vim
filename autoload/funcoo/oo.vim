" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:foo = funcoo#dict#module

let s:class = {'name': 'Class'}
let s:class.class = s:class

function! s:class.new(name, superclass) dict abort "{{{
  let klass            = s:foo.clone(self)
  let klass.name       = a:name
  let klass.superclass = a:superclass
  let klass.class      = self
  return klass
endfunction
"}}}

function! s:class.include(object) dict abort "{{{
  let self.__proto__ = s:foo.extend(self.__proto__, a:object)
  return self
endfunction
"}}}

let s:object = s:class.new('Object', 0)

let s:class.superclass = s:object

function! s:object.new(...) dict abort "{{{
  let instance = s:foo.clone(self.__proto__)
  call call(instance.init, a:000, instance)
  return instance
endfunction
"}}}

let s:obj = {}

function! s:obj.init() dict abort "{{{
endfunction
"}}}

let s:object.__proto__ = s:obj

function! s:class.new(name, ...) dict abort "{{{
  let super                 = a:0 ? a:1 : s:object
  let klass                 = s:foo.clone(super)
  let klass.name            = a:name
  let klass.superclass      = super
  let klass.__proto__       = s:foo.clone(super.__proto__)
  let klass.__proto__.class = klass
  return klass
endfunction
"}}}

let s:object.__proto__ = s:obj

if !exists('funcoo_debug') || !funcoo_debug
  lockvar s:obj
  lockvar s:object
  lockvar s:class
endif

let funcoo#oo#class = s:class
let funcoo#oo#object = s:object
