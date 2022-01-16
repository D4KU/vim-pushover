if exists('g:loaded_pushover')
    finish
endif

if exists(':NeoBundleDepends') == 2
    NeoBundleDepends 'tommcdo/vim-exchange'
endif

if !exists('g:pushover_forward_prefix')
    let g:pushover_forward_prefix = '>'
endif
if !exists('g:pushover_backward_prefix')
    let g:pushover_backward_prefix = '<'
endif
if !exists('g:pushover_map_plugs')
    let g:pushover_map_plugs = 1
endif
if !exists('g:pushover_maps')
    let g:pushover_maps =
        \ {
        \   'w': ['iw', 'w', 'b'],
        \   'W': ['iW', 'W', 'B'],
        \   'p': ['ip', '}j', '{k']
        \ }
endif

for [k, v] in items(g:pushover_maps)
    call pushover#map(k, v[0], v[1], v[2])
endfor

let g:loaded_pushover = 1
