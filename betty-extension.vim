" Global variables
let g:betty_isActive = 1
let g:betty_showedError = 0
let g:betty_messages = {}
let g:betty_match_ids = []

" Highlight definitions
highlight ErrorHighlight ctermbg=red guibg=red
highlight WarningHighlight ctermbg=yellow guibg=yellow

" Key mappings
nnoremap <C-a> :BettyToggle<CR>

" Commands
command! BettyToggle call BettyToggle()

" Auto commands
autocmd InsertLeave *.c,*.h call BettyCheckAndHighlight()
autocmd CursorMoved *.c,*.h call DisplayCurrentLineMessage()
autocmd InsertEnter *.c,*.h call ClearOldHighlights() 

" Toggle the Betty extension on and off
function! BettyToggle()
    let g:betty_isActive = !g:betty_isActive
    echom "Betty: Extension " . (g:betty_isActive ? "Activated" : "Deactivated")
    call ClearOldHighlights()
    call BettyCheckAndHighlight()
endfunction

" Display the message for the current line if it exists
function! DisplayCurrentLineMessage()
    if has_key(g:betty_messages, line('.'))
        let l:betty_message = g:betty_messages[line('.')]
        echo "Betty " . betty_message["type"] . ": "  . betty_message["message"]
    else
        echo ""
    endif
endfunction

" Check and highlight issues in the code
function! BettyCheckAndHighlight()
    if !g:betty_isActive
        return
    endif

    write

    let l:filename = expand('%:t')
    let l:output = system('betty ' . l:filename)

    call HandleBettyNotFound(l:output)
    call ClearOldHighlights()
    call ParseBettyOutput(l:output)
    call ApplyNewHighlights()
endfunction

" Handle the case where Betty is not found
function! HandleBettyNotFound(output)
    if a:output =~ 'betty: not found' && !g:betty_showedError
        let g:betty_showedError = 1
        echoerr 'Betty: betty not found'
    endif
endfunction

" Clear old highlights
function! ClearOldHighlights()
    let g:betty_messages = {}
    for id in g:betty_match_ids
        call matchdelete(id)
    endfor
    let g:betty_match_ids = []
endfunction

" Parse the output from Betty and populate g:betty_messages
function! ParseBettyOutput(output)
    let g:betty_messages = {}
    for line in split(a:output, '\n')
        if line =~ '\v\S'
            let match = split(line, ':')
            if len(match) >= 4
                let l:lineNumber = str2nr(match[1])
                let l:type = tolower(trim(match[2]))
                let l:message = trim(join(match[3:], ':'))
                let g:betty_messages[l:lineNumber] = {'message': l:message, 'type': l:type}
            endif
        endif
    endfor
endfunction

" Apply new highlights based on g:betty_messages
function! ApplyNewHighlights()
    for [line, betty_message] in items(g:betty_messages)
        let id = matchadd(betty_message.type == 'error' ? 'ErrorHighlight' : 'WarningHighlight', '\%' . line . 'l\S.*$')
        if id != 0
            call add(g:betty_match_ids, id)
        endif
    endfor
endfunction
