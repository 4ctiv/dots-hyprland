" 4ctiv's vim config (Note: " marks a comment)

" Set shell while using vim
" This is relevant for e.g. :! or :shell
set shell=/bin/bash

" Set Font with ligerature
 set guifont=JetBrainsMono\ Nerd\ Font\ Mono

" Relative line numbers
 set number
 set relativenumber

" Code Indentation
" [Reference](https://vim.fandom.com/wiki/Indenting_source_code#Methods%20for20automatic20indentation)
 if has("autocmd")
   " Load indent files, to automatically do language-dependent indenting.
   " Configuration Files: `~/.vim/after/ftplugin/EXTENSION_TYP.vim`
   filetype plugin indent on
 endif
 set expandtab    " Always insert spaces instead of tabs
 set shiftwidth=2 " Tab ~ 2 Spaces
 set tabstop=2 " Note: softtabstop ~ local ; tabstop ~ global

" Highlight special characters
" Test:   	 
 set listchars=tab:—⇥
"set listchars+=space:␣
 set listchars+=trail:␣,extends:…,precedes:…
"set listchars+=eol:↵
 set list

" Syntax Highlighting
 syntax on

"""Folding"""
" https://www.vimfromscratch.com/articles/vim-folding
 setlocal foldmethod=indent "syntax marker indent
 setlocal nofoldenable

"""Code Formating"""
" https://www.cs.swarthmore.edu/oldhelp/vim/reformatting.html
 set formatoptions=tcq

" Code ruler
 set colorcolumn=81
 highlight ColorColumn ctermbg=232

" Change line number color based on vim mode
" (Note: Visual mode has no events on enter/leave)
 autocmd InsertLeave * highlight LineNr ctermfg=yellow guibg=black
"autocmd VisualLeave * highlight LineNr ctermfg=yellow guibg=black

 autocmd InsertEnter * highlight LineNr ctermfg=red    guibg=red
"autocmd VisualEnter * highlight LineNr ctermfg=cyan   guibg=darkcyan

"""WARNINGS"""
" Show read only warning
 set confirm
 augroup FileWritableCheck
   autocmd!
   autocmd BufReadPost * if filereadable(expand('%')) && !filewritable(expand('%')) | echohl WarningMsg | echo "Warning: File is not writable!" | echohl None | endif
 augroup END

"""HOTKEYS"""
" <S-...> Shift ; <M-...> Alt ; <C-...> Strg ; <...>[1;53s AltGr
" NOTE: MAC maynot work with <A-...>, use [ALT] + [KEY] resulting letter instead

"nnoremap <F1> :help <CR>                        " open help page
 nnoremap <F1> :Explore <CR>                     " File browser
 nnoremap <F2> :set number! relativenumber! <CR> " toggle line numbers
 nnoremap <F3> :set wrap! <CR>                   " toggle line wrap
 nnoremap <F4> :<C-u>retab!<CR>:keepjumps keeppatterns %s/\s\+$//e<CR> " replace tabs & remove trailing whitespace

 nnoremap <F5> gg=G <CR>                         " Format file
 nnoremap <F6> zc   <CR>                         " Fold
 nnoremap <S-F6> zM <CR>                         " Fold all
 nnoremap <C-F6> zM <CR>                         " Fold all
 nnoremap <F7> zo   <CR>                         " Un-fold
 nnoremap <S-F7> zR <CR>                         " Un-fold all
 nnoremap <C-F7> zR <CR>                         " Un-fold all

 " Syntax highlight overides
 " NOTE: You can use `:setfiletype` instead of `:set syntax=` to also use
 " language features (e.g. indentation)
 noremap <C-S-r> :set syntax=ON <CR>             " Set syntax to automatic detection
 noremap <C-S-j> :set syntax=json5 <CR>          " Set syntax to json5 (json with comments)
 noremap <C-S-m> :set syntax=markdown <CR>       " Set syntax to markdown (form of rich text)
 noremap <C-S-x> :set syntax=xml <CR>            " Set syntax to xml (structured text, e.g. html)

" nnoremap <C-S-s> :w !sudo tee % > /dev/null <CR> " Save as admin
