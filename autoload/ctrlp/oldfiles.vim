" https://gist.github.com/kien/1573031/6726d676addc38e811ae572ef09d56c75803834e
" =============================================================================
" File:          autoload/ctrlp/oldfiles.vim
" Description:   Find files saved in viminfo: jumplist, changelist, marks ...
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" User Configuration {{{
" Enable:
"        let g:ctrlp_extensions += ['oldfiles']
" Create A Command:
"        com! CtrlPOF cal ctrlp#init(ctrlp#oldfiles#id())
"}}}

" Init {{{

if !has('viminfo') && !has('nvim')
	fini
en
if exists('g:loaded_ctrlp_oldfiles') && g:loaded_ctrlp_oldfiles
	fini
en
let g:loaded_ctrlp_oldfiles = 1

let s:oldfiles_var = {
			\ 'init'  : 'ctrlp#oldfiles#init()',
			\ 'accept': 'ctrlp#oldfiles#accept',
			\ 'lname' : 'oldfiles',
			\ 'sname' : 'oldf',
			\ 'sort'  : 0,
			\ 'nolim' : 1,
			\ }

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
	let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:oldfiles_var)
el
	let g:ctrlp_ext_vars = [s:oldfiles_var]
en

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" }}}
" Public {{{

function! ctrlp#oldfiles#init() abort
	retu filter(map(copy(v:oldfiles), 'expand(v:val)'), 'filereadable(v:val)')
endfunction

function! ctrlp#oldfiles#accept(mode, str) abort
	cal ctrlp#acceptfile(a:mode, a:str)
endfunction

function! ctrlp#oldfiles#id() abort
	retu s:id
endfunction

" }}}
