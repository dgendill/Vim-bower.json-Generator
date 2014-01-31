"" " File: bowerJson
" Author: Dominick Gendill
" Last Change: 31-Jan-2014.
" Version: 1.0
" Usage:
"
" Run command :BowerJson() to generate the bower.json markup

function! BowerJson()
  let l:module_name=expand('%:p:h:t')

  call append(0, [
    \'{',
    \repeat(' ', &shiftwidth) . '"name": "my-project"',
    \repeat(' ', &shiftwidth) . '"version": "1.0.0"',
    \repeat(' ', &shiftwidth) . '"main": "path/to/main.css"',
    \repeat(' ', &shiftwidth) . '"ignore": [',
    \repeat(' ', &shiftwidth) . repeat(' ', &shiftwidth) . '".jshintrc",',
    \repeat(' ', &shiftwidth) . repeat(' ', &shiftwidth) . '"**/*.txt"',
    \repeat(' ', &shiftwidth) . '],',
    \repeat(' ', &shiftwidth) . '"dependencies": {',
    \repeat(' ', &shiftwidth) . repeat(' ', &shiftwidth) . '"<name>": "<version>",',
    \repeat(' ', &shiftwidth) . repeat(' ', &shiftwidth) . '"<name>": "<folder>",',
    \repeat(' ', &shiftwidth) . repeat(' ', &shiftwidth) . '"<name>": "<package>"',
    \repeat(' ', &shiftwidth) . '},',
    \repeat(' ', &shiftwidth) . '"devDependencies": {',
    \repeat(' ', &shiftwidth) . repeat(' ', &shiftwidth) . '"<test-framework-name>": "<version>"',
    \repeat(' ', &shiftwidth) . '}'])

  call append(line('$')-1, [ '}' ] )
  
  " And remove the empty line at the end
  normal dd

endfunction

if !exists("s:autocommands_loaded")
  let s:autocommands_loaded = 1
  autocmd BufNewFile package.json :call CommonJSPackageJsonTemplate()
endif
