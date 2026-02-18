" 4ctiv's vim config (Note: " marks a comment)

"""Theme"""
 "let ayucolor="dark"
 colorscheme rosepine " ~/.vim/colors/ayu.vim
 " Disable theme background color
 let g:disable_bg=1
 let g:disable_float_bg=1

" Make vim not fake it beeing "vi"
" [Reference](https://www.youtube.com/watch?v=XA2WjJbmmoM)
 set nocompatible

" Enable file browsing
" Allows recursive search via `:find FILE/FOLDER`
 filetype plugin on
 set wildmenu
 set path+=**

" Make splits open on botton (e.g. :term)
 set splitbelow

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
 set listchars=tab:>>
"set listchars+=space:␣
 set listchars+=trail:-,extends:>,precedes:<
"set listchars+=eol:$
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
 autocmd InsertLeave * highlight LineNr ctermfg=NONE guibg=black
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
" Highlight git conflicts
 highlight git_conflict ctermbg=red ctermfg=white

"syn region git_conflict_S start=/^<<<<<<< .*$/ end=/^\\ze\$$=======$\\||||||||\$$/
"syn region git_conflict_M start=/^||||||| .*$/ end=/^\\ze=======$/
"syn region git_conflict_E start=/^\$$=======$\\||||||| |\$$/ end=/^>>>>>>> .*$/

 syntax match git_conflict /^<<<<<<<.*$/
 syntax match git_conflict /^=======.*$/
 syntax match git_conflict /^>>>>>>>.*$/

"""HOTKEYS"""
" <S-...> Shift ; <M-...> Alt ; <C-...> Strg ; <...>[1;53s AltGr
" NOTE: MAC maynot work with <A-...>, use [ALT] + [KEY] resulting letter instead

"Remap autocomplete ([CTRL]+[N] -> [CTRL]+[SPACE])
 inoremap <C-Space> <C-n>

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
 
 nnoremap <F11> gD                               " Jump to declaration
 nnoremap <C-F11> <C-O>                          "  Jump back (dec)
 nnoremap <F12> gd                               " Jump to definition
 nnoremap <C-F12> <C-O>                          "  Jump back (def)

 " Save as admin (usefull if opened user has no rw rights)
 " NOTE: [CTRL] + [S] + [_] is somewhat unreliable
 nnoremap <M-S-S> :w !sudo tee % > /dev/null<CR>:e!<CR> " Save file as admin

 " Syntax highlight overides
 " NOTE: You can use `:setfiletype` instead of `:set syntax=` to also use
 " language features (e.g. indentation)
 noremap <M-S-r> :set syntax=ON <CR>             " Set syntax to automatic detection
 noremap <M-S-b> :set syntax=bash <CR>           " Set syntax to bash (common linux script language)
 noremap <M-S-j> :set syntax=json5 <CR>          " Set syntax to json5
 noremap <M-S-y> :set syntax=yaml <CR>           " Set syntax to yaml
 noremap <M-S-m> :set syntax=markdown <CR>       " Set syntax to markdown
 noremap <M-S-p> :set syntax=ps1 <CR>            " Set syntax to powershell
 noremap <M-S-x> :set syntax=xml <CR>            " Set syntax to xml (~html)

 " Markdown viewer
function! Open_Glow_Right_Split()
   if !executable('glow') | return | endif

   set nolist
   rightbelow vertical terminal bash -c "glow % | less"
   let l:term = bufnr('%')
   wincmd h | set list

   " Auto refresh on save
   execute 'autocmd BufWritePost <buffer> if bufexists(' . l:term . ') | silent! call term_sendkeys(' . l:term . ', "glow %\<CR>") | endif'

   " Clean up when closing
   execute 'autocmd BufWinLeave <buffer> if bufexists(' . l:term . ') | bd! ' . l:term . ' | endif'
endfunction

nnoremap <C-p> :call Open_Glow_Right_Split()<CR> " Use [CTRL] + [\] -> [CTRL] + [n] to make it scrollable (removes auto update)

