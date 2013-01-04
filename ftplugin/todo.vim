" Plugin to easy handle the ado with vim
" Maintainer: proft
" Version: 0.1

" check if the plugin is already loaded
if exists("loaded_vimado")
    finish
endif
let loaded_vimado = 1

" function to toggle done status
function! s:TaskDone()
    let line = getline(".")
    if (line =~ '-\{1}\s')
       let line2 = substitute(line, "-", "+", "")
       call setline(".", line2)
       echo "Task done!"
    elseif (line =~ '+\{1}\s')
        let line2 = substitute(line, "+", "-", "")
        call setline(".", line2)
        echo "Task undone!"
    elseif (line =~ '!\{1}\s')
        let line2 = substitute(line, "!", "+", "")
        call setline(".", line2)
        echo "Important task done!"
    else    
        echo "It's not a task!"
    endif
endfunction

" function to toggle delay status
function! s:TaskDelay()
    let line = getline(".")
    if (line =~ '-\{1}\s')
       let line2 = substitute(line, "-", "#", "")
       call setline(".", line2)
       echo "Task is delayed!"
    elseif (line =~ '#\{1}\s')
        let line2 = substitute(line, "#", "-", "")
        call setline(".", line2)
        echo "Task active!"
    elseif (line =~ '!\{1}\s')
        let line2 = substitute(line, "!", "#", "")
        call setline(".", line2)
        echo "Important task is delayed!"
    else    
        echo "It's not a task!"
    endif
endfunction


" function to toggle urgent status
function! s:TaskUrgent()
    let line = getline(".")
    if (line =~ '-\{1}\s')
        let line2 = substitute(line, "-", "!", "")
        call setline(".", line2)
        echo "Urgent task!"
    elseif (line =~ '!\{1}\s')
        let line2 = substitute(line, "!", "-", "")
        call setline(".", line2)
        echo "Normal task!"
    else
        echo "It's not a task"
    endif
endfunction

" set up mappings
noremap <unique> <script> <Plug>TaskDone        :call <SID>TaskDone()<CR>
noremap <unique> <script> <Plug>TaskUrgent   :call <SID>TaskUrgent()<CR>
noremap <unique> <script> <Plug>TaskDelay        :call <SID>TaskDelay()<CR>

nmap <buffer> <silent> <leader>tc <Plug>TaskDone
nmap <buffer> <silent> <leader>tu <Plug>TaskUrgent
nmap <buffer> <silent> <leader>td <Plug>TaskDelay
