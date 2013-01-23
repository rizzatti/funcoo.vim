" Description: Functional Object Oriented goodies for Vim
" Author: Zeh Rizzatti <zehrizzatti@gmail.com>
" License: MIT

function! funcoo#clone(object) abort "{{{
  return copy(a:object)
endfunction
"}}}

function! funcoo#extend(destination, ...) abort "{{{
  let extended = funcoo#clone(destination)
  for source in a:000
    call extend(extended, source)
  endfor
  return extended
endfunction
"}}}

let s:class = {'name': 'Class'}
let s:class.class = s:class

function! s:class.new(name, superclass) dict abort "{{{
  let klass            = funcoo#clone(self)
  let klass.name       = a:name
  let klass.superclass = a:superclass
  let klass.class      = self
  return klass
endfunction
"}}}

function! s:class.include(object) dict abort "{{{
  let self.__proto__ = funcoo#extend(self.__proto__, a:object)
endfunction
"}}}

let s:object = s:class.new('Object', 0)

let s:class.superclass = s:object

function! s:object.new(...) dict abort "{{{
  let instance = funcoo#clone(self.__proto__)
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
  let super                 = a:0 ? a:1 : g:funcoo#object
  let klass                 = funcoo#clone(super)
  let klass.name            = a:name
  let klass.superclass      = super
  let klass.__proto__       = funcoo#clone(super.__proto__)
  let klass.__proto__.class = klass
  return klass
endfunction
"}}}

let funcoo#class = s:class
let funcoo#object = s:object
