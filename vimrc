set number          " show line numbers

set tabstop=4
set shiftwidth=4
set expandtab       " expand tabs to spaces


set title           " change the terminal's title

set scrolloff=7     " keep 3 lines when scrolling

" show location
"set cursorcolumn
"set cursorline

set showmode        " display incomplete commands
set showcmd         " display current modes


set ignorecase      " ignore case when searching
set smartcase       " no ignorecase if Uppercase char present

" status line
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
"set laststatus=2   " Always show the status line - use 2 lines for the status bar

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    " .sh
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    " python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\#-*- encoding:utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc


" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Hold the select after move
vnoremap < <gv
vnoremap > >gv
