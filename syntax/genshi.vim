" Vim syntax file
" Language:	Genshi plain text template
" Maintainer:	Holger Weiss <holger@ZEDAT.FU-Berlin.DE>
" Last Change:	2011 Jun 20

if exists("b:current_syntax")
  finish
endif

syn include @pythonCode syntax/python.vim

syn case match

syn cluster genshiCode
  \ contains=genshiFunction,genshiExpression,genshiOperator,genshiStatement

syn keyword genshiFunction defined value_of contained
syn keyword genshiStatement def for if include with contained
syn keyword genshiStatement choose when otherwise contained
syn keyword genshiStatement end contained skipempty nextgroup=genshiEndComment
syn keyword genshiOperator in contained
syn keyword genshiTodo TODO FIXME XXX contained

syn match genshiEndComment "\_.\{-1,}%}" contained contains=genshiTodo
syn match genshiError "{[%#]" contained display
syn match genshiEscaped "\$\$" display
syn match genshiEscaped "\\{[%#]" display
syn match genshiExpression "\$[a-zA-Z0-9\._]\+" display

syn region genshiExpression start="\${" end="}"
  \ contains=@pythonCode,genshiExpression,genshiFunction
syn region genshiBlock matchgroup=genshiDelimiter start="{%" end="%}\(\\$\)\?" keepend
  \ contains=@pythonCode,@genshiCode,genshiError
syn region genshiPythonBlock matchgroup=genshiPythonDelimiter start="{%\_s\+python\_s" end="%}\(\\$\)\?" keepend
  \ contains=@pythonCode,genshiError
syn region genshiComment start="{#" end="#}\(\\$\)\?"
  \ contains=genshiTodo

hi link genshiError Error
hi link genshiComment Comment
hi link genshiDelimiter PreProc
hi link genshiEndComment Comment
hi link genshiEscaped Special
hi link genshiExpression Identifier
hi link genshiFunction Function
hi link genshiOperator Operator
hi link genshiPythonDelimiter Type
hi link genshiStatement Statement
hi link genshiTodo Todo

let b:current_syntax = "genshi"
