Modified version of https://gist.github.com/kien/1573031/6726d676addc38e811ae572ef09d56c75803834e
to support newer ctrlp.

## To use:

```
" User Configuration {{{1
" Enable:
"        let g:ctrlp_extensions += ['oldfiles']
" Create A Command:
"        com! CtrlPOF cal ctrlp#init(ctrlp#oldfiles#id())
"}}}
```
