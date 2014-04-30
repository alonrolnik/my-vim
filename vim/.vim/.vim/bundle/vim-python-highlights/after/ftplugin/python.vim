syn region pythonString start=+[bB]\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell
syn region pythonString start=+[bB]\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell
syn region pythonString start=+[bB]\="""+ end=+"""+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonString start=+[bB]\='''+ end=+'''+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest,pythonSpaceError,@Spell

syn match pythonEscape +\\[abfnrtv'"\\]+ display contained
syn match pythonEscape "\\\o\o\=\o\=" display contained
syn match pythonEscapeError "\\\o\{,2}[89]" display contained
syn match pythonEscape "\\x\x\{2}" display contained
syn match pythonEscapeError "\\x\x\=\X" display contained
syn match pythonEscape "\\$"

" Unicode
syn region pythonUniString start=+[uU]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,@Spell
syn region pythonUniString start=+[uU]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,@Spell
syn region pythonUniString start=+[uU]"""+ end=+"""+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonUniString start=+[uU]'''+ end=+'''+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell

syn match pythonUniEscape "\\u\x\{4}" display contained
syn match pythonUniEscapeError "\\u\x\{,3}\X" display contained
syn match pythonUniEscape "\\U\x\{8}" display contained
syn match pythonUniEscapeError "\\U\x\{,7}\X" display contained
syn match pythonUniEscape "\\N{[A-Z ]\+}" display contained
syn match pythonUniEscapeError "\\N{[^A-Z ]\+}" display contained

" Raw strings
syn region pythonRawString start=+[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString start=+[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString start=+[rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
syn region pythonRawString start=+[rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell

syn match pythonRawEscape +\\['"]+ display transparent contained

" Unicode raw strings
syn region pythonUniRawString start=+[uU][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syn region pythonUniRawString start=+[uU][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syn region pythonUniRawString start=+[uU][rR]"""+ end=+"""+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonUniRawString start=+[uU][rR]'''+ end=+'''+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest,pythonSpaceError,@Spell

syn match pythonUniRawEscape "\([^\\]\(\\\\\)*\)\@<=\\u\x\{4}" display contained
syn match pythonUniRawEscapeError "\([^\\]\(\\\\\)*\)\@<=\\u\x\{,3}\X" display contained

" String formatting
syn match pythonStrFormatting "%\(([^)]\+)\)\=[-#0 +]*\d*\(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syn match pythonStrFormatting "%[-#0 +]*\(\*\|\d\+\)\=\(\.\(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

" Str.format syntax
syn match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syn match pythonStrFormat "{\([a-zA-Z0-9_]*\|\d\+\)\(\.[a-zA-Z_][a-zA-Z0-9_]*\|\[\(\d\+\|[^!:\}]\+\)\]\)*\(![rs]\)\=\(:\({\([a-zA-Z_][a-zA-Z0-9_]*\|\d\+\)}\|\([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*\(\.\d\+\)\=[bcdeEfFgGnoxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

" String templates
syn match pythonStrTemplate "\$\$" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syn match pythonStrTemplate "\${[a-zA-Z_][a-zA-Z0-9_]*}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syn match pythonStrTemplate "\$[a-zA-Z_][a-zA-Z0-9_]*" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

" DocTests
syn region pythonDocTest start="^\s*>>>" end=+'''+he=s-1 end="^\s*$" contained
syn region pythonDocTest2 start="^\s*>>>" end=+"""+he=s-1 end="^\s*$" contained

hi def link pythonString String
hi def link pythonUniString String
hi def link pythonRawString String
hi def link pythonUniRawString String

hi def link pythonEscape Special
hi def link pythonEscapeError Error
hi def link pythonUniEscape Special
hi def link pythonUniEscapeError Error
hi def link pythonUniRawEscape Special
hi def link pythonUniRawEscapeError Error

hi def link pythonStrFormatting Special
hi def link pythonStrFormat Special
hi def link pythonStrTemplate Special
