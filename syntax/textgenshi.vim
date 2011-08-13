" Vim syntax file
" Language:	Genshi plain text template
" Maintainer:	Holger Weiss <holger@ZEDAT.FU-Berlin.DE>
" Last Change:	2011 Aug 13

if exists("b:current_syntax")
  finish
endif

syn include @pythonCode syntax/python.vim

syn case match

syn cluster textgenshiCode
  \ contains=textgenshiFunction,textgenshiOperator,textgenshiStatement

syn keyword textgenshiFunction defined value_of contained
syn keyword textgenshiStatement def for if include with contained
syn keyword textgenshiStatement choose when otherwise contained
syn keyword textgenshiStatement end contained skipempty nextgroup=textgenshiEndComment
syn keyword textgenshiOperator in contained
syn keyword textgenshiTodo TODO FIXME XXX contained

syn match textgenshiEndComment "\_.\{-1,}%}" contained contains=textgenshiTodo
syn match textgenshiError "{[%#]" contained display
syn match textgenshiEscaped "\\\n" display
syn match textgenshiEscaped "\$\$" display
syn match textgenshiEscaped "\\{[%#]" display
syn match textgenshiExpression "\$[a-zA-Z0-9._]\+" display

syn region textgenshiExpression start="\${" end="}"
  \ contains=@pythonCode,textgenshiFunction
syn region textgenshiBlock matchgroup=textgenshiDelimiter start="{%" end="%}" keepend
  \ contains=@pythonCode,@textgenshiCode,textgenshiError
syn region textgenshiPythonBlock matchgroup=textgenshiPythonDelimiter start="{%\_s\+python\_s" end="%}" keepend
  \ contains=@pythonCode,textgenshiError
syn region textgenshiComment start="{#" end="#}"
  \ contains=textgenshiTodo

hi link textgenshiError Error
hi link textgenshiComment Comment
hi link textgenshiDelimiter PreProc
hi link textgenshiEndComment Comment
hi link textgenshiEscaped Special
hi link textgenshiExpression Identifier
hi link textgenshiFunction Function
hi link textgenshiOperator Operator
hi link textgenshiPythonDelimiter Type
hi link textgenshiStatement Statement
hi link textgenshiTodo Todo

let b:current_syntax = "textgenshi"
