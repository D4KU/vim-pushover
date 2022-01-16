This tiny vim plugin provides an interface to easily create mappings to push
around text-objects. Pushing can be understood as deleting the text-object
under the cursor, making a motion, and pasting it again. It can also be
used to swap adjacent text-objects.


## Installation

With [vim-plug](https://github.com/junegunn/vim-plug):
```
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-exchange'
Plug 'd4ku/vim-pushover'
```

This plugin has a hard dependency to
[vim-exchange](https://github.com/tommcdo/vim-exchange). If you want to make
the created mappings repeatable,
[vim-repeat](https://github.com/tpope/vim-repeat) must be installed, too.


## Customization

### Change prefix

By default, the plugin creates the mappings `<w`, `>w`, `<W`, `>W`, `<p`, and
`>p` to push around words, WORDs, and paragraphs; forwards and backwards.  To
change the `<` or `>` prefix, set the following variables:

```
    let g:pushover_forward_prefix = '>'
    let g:pushover_backward_prefix = '<'
```

### Change mappings

To supply additional mappings or change the default ones, set
`g:pushover_maps`. The following example adds support for
[vim-wordmotion](https://github.com/chaoren/vim-wordmotion) via the `<Leader>`
mappings, while keeping the defaults:

```
  let g:pushover_maps =
      \ {
      \   'w': ['iw', 'w', 'b'],
      \   'W': ['iW', 'W', 'B'],
      \   'p': ['ip', '}j', '{k'],
      \   '<Leader>w': ['i<Leader>w', '<Leader>w', '<Leader>b']
      \ }
```

The dictionary's keys are the mapping names later combined with the prefix.
The values are lists with the following three strings as elements:

  1. text-object to remove and paste elsewhere
  2. motion to move forward to the paste location
  3. motion to move backward to the paste location

If these text-objects and motions have been remapped themselves, vim-pushover
respects that.

### Prevent automatic mapping

By default, the plugin creates `<Plug>` mappings that are then mapped to the
concatenation of the prefix and dictionary key. If you wish to create all the
mappings yourself, for example if they are conflicting with other plugins, set
the following variable to `0`:
```
    let g:pushover_map_plugs = 0
    nmap [w <Plug>Pushover_<w
    nmap ]w <Plug>Pushover_>w
    nmap <Leader>P <Plug>Pushover_<p
    nmap <Leader>p <Plug>Pushover_>p
```
