" Create mapping to swap text objects a motion away
function! s:Map(name, obj, motion)
    let l:plug = '<Plug>Pushover_' . a:name

    " make <Plug> map to rhs
    execute 'nnoremap <silent> ' . l:plug .
        \ ' :<C-U>call pushover#push("' . a:obj . '", "' . a:motion .
        \ '") <BAR> silent! call repeat#set("\' . l:plug . '", v:count)<CR>'

    " make lhs map to <Plug>
    if g:pushover_map_plugs
        execute 'nmap ' . a:name . ' ' . l:plug
    endif
endfunction

" Swap text object under cursor with text object 'count' motion's away
function! pushover#push(obj, motion)
    let l:i = v:count1
    while l:i > 0
        let l:i -= 1
        execute 'normal cx' . a:obj . a:motion . 'cx' . a:obj
    endwhile
endfunction

" Create two mapping to swap adjacent text objects forwards and backwards
function! pushover#map(name, obj, forw, backw)
    call s:Map(g:pushover_forward_prefix  . a:name, a:obj, a:forw)
    call s:Map(g:pushover_backward_prefix . a:name, a:obj, a:backw)
endfunction

