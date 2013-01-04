if exists("b:current_syntax")
  finish
endif

syn case ignore

syn match todoTitle /^\w\+.*[^:]$/ contains=todoPriority
syn match todoTask /[-]\s.*$/
syn match todoWait /[#]\s.*$/
syn match todoUrgent /[!]\s.*$/
syn match todoDone /[+]\s.*$/
syn match todoPriority /@\d*/ contained

hi todoTitle guifg=#8AC6F2
hi todoTask guifg=#F4F4F4
hi todoWait guifg=#3D3D3D
hi todoUrgent guifg=#F28A92
hi todoDone guifg=#C6F28A
hi todoPriority guifg=#F28A92

syn sync fromstart

let b:current_syntax = "todo"
