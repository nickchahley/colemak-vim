" {{{ Description
"   Original by Shai Coleman, 2008-04-21.  http://colemak.com/
"   Modified by Joel Esko, 2012-09-14. github.com/jooize/vim-colemak
"	  Modified by Nick Chahley, 2016+
"
"   Load colemak.vim after all other Vim scripts.
"   Unmappable: <C-s>, <C-q> (intercepted before reaching editor)
" }}}
" {{{ Require Vim >=7.0 
	if v:version < 700 | echohl WarningMsg | echo "colemak.vim: You need Vim version 7.0 or later." | echohl None | finish | endif
" }}}
" {{{ Up/down/left/right
	nnoremap n h|xnoremap n h|onoremap n h|
	nnoremap o l|xnoremap o l|onoremap o l|
	" Always go down/up one line regardless of "set wrap". Is that a sane default?
	nnoremap e gj|xnoremap e gj|onoremap e gj|
	nnoremap i gk|xnoremap i gk|onoremap i gk|
	" Add maps for down/up count lines, ignoring wraps
	nnoremap ge j|xnoremap e j|onoremap e j|
	nnoremap gi k|xnoremap i k|onoremap i k|
	" Turbo Navigation
	" Works with counts, see ":help complex-repeat"
	nnoremap <silent> N @='5h'<CR>|xnoremap <silent> N @='5h'<CR>|onoremap <silent> N @='5h'<CR>|
	nnoremap <silent> O @='5l'<CR>|xnoremap <silent> O @='5l'<CR>|onoremap <silent> O @='5l'<CR>|
	" Always go down/up 5 line regardless of "set wrap". Is that a sane default?
	nnoremap <silent> E @='5gj'<CR>|xnoremap <silent> E @='5gj'<CR>|onoremap <silent> E @='5gj'<CR>|
	nnoremap <silent> I @='5gk'<CR>|xnoremap <silent> I @='5gk'<CR>|onoremap <silent> I @='5gk'<CR>|

	" Window and Split handling
	nnoremap <C-w>n <C-w>h|xnoremap <C-w>n <C-w>h|
	nnoremap <C-w>e <C-w>j|xnoremap <C-w>e <C-w>j|
	nnoremap <C-w>i <C-w>k|xnoremap <C-w>i <C-w>k|
	nnoremap <C-w>o <C-w>l|xnoremap <C-w>o <C-w>l|

	" Scroll down (replace <C-e>)
	nnoremap <C-p> <C-e>|xnoremap <C-p> <C-e>|onoremap <C-p> <C-e>|
" }}}
" {{{ Words forward/backward
	" l/L = fwd Last char of word/WORD (crf b/B)
	nnoremap l e|xnoremap l e|onoremap l e| 
	nnoremap L E|xnoremap L E|onoremap L E|
" }}}
" {{{ Insert mode 
	nnoremap s i|
	nnoremap S I|

	" Make insert/add work also in visual line mode like in visual block mode
	xnoremap <silent> <expr> s (mode() =~# "[V]" ? "\<C-v>0o$I" : "I")
	xnoremap <silent> <expr> S (mode() =~# "[V]" ? "\<C-v>0o$I" : "I")

	" alias gs to gi since we use 's' for insert
	" Goes to the last insertion point and gets in insert mode
	nnoremap gs gi
" }}}
" {{{ Open Lines (insert on newline)
	nnoremap h o
	nnoremap H O

	" Open newline, then put. Opt: prefix w/ reg ["+,(v/V)] (above/below) 
	nnoremap <expr> <leader>p 'o<ESC>"'.v:register.v:count1.'p'
" }}}
" {{{ Search
	" Next/prev search match
	" I.e., Repeat latest / or ? [count] times fwd/bkw (n/N)
	nnoremap k n|xnoremap k n|onoremap k n|
	nnoremap K N|xnoremap K N|onoremap K N|
" }}}
" {{{ Jumping Around 
	" Indexed Line Jumping 
	" 123<CR> will jump to line 123, vs jump down 123 lines
	" '' = return to prev loc in file (for when you accidently hit <CR>)
	nnoremap <CR> G
	" Get numeric keypad working for line jumping
	nmap <kEnter> <Enter> 

	" Jump List, see :h jumps
	" Mv u/d (h/d) jump list [c] times; [c]<C-h>; :jumps = view list
	nnoremap <C-S-u> <C-o>
	nnoremap <C-S-d> <C-i>
" }}}
" {{{ inneR text objects 
	" e.g. drp equivilant to dip (delete inner paragraph)
	onoremap r i
" }}}
" vim: set foldmethod=marker:
