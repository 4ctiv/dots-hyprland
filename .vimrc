" 4ctiv's vim config (Note: " marks a comment)

" Set Font with ligerature
set guifont=JetBrainsMono\ Nerd\ Font\ Mono

" Relative line numbers
 set number
 set relativenumber

" Tab |-> 2 spaces
 set autoindent
 set expandtab
 set shiftwidth=2
 set tabstop=2
" tabstop affect file’s content, softtabstop affect tab/backspace behavior
" tabstop ~ global setting, softtabstop ~ local to current line

" Highlight special characters
  "  "	 
 set listchars=tab:—⇥
"set listchars+=space:␣
 set listchars+=trail:␣,extends:…,precedes:…
"set listchars=eol:↵
 set list

" Syntax Highlighting
 syntax on

" Code Folding
" https://www.vimfromscratch.com/articles/vim-folding
 setlocal foldmethod=indent "syntax marker indent
 setlocal nofoldenable

" Change line number color based on vim mode
" (Note: Visual mode has no events on enter/leave)
 autocmd InsertLeave * highlight LineNr ctermfg=yellow guibg=black
"autocmd VisualLeave * highlight LineNr ctermfg=yellow guibg=black

 autocmd InsertEnter * highlight LineNr ctermfg=red    guibg=red
"autocmd VisualEnter * highlight LineNr ctermfg=cyan   guibg=darkcyan

" Show read only warning
augroup FileWritableCheck
  autocmd!
  autocmd BufReadPost * if filereadable(expand('%')) && !filewritable(expand('%')) | echohl WarningMsg | echo "Warning: File is not writable!" | echohl None | endif
augroup END

" HOTKEYS
" <S-...> Shift ; <A-...> Alt ; <C-...> Strg ; <...>[1;53s AltGr

"nnoremap <F1> :help <CR>                        " open help page
 nnoremap <F2> :set number! relativenumber! <CR> " toggle line numbers
 nnoremap <F3> :retab <CR>                       " Replace tabs with spaces
 nnoremap <F4> gg=G <CR> " toggle line numbers   " Auto indent file

 nnoremap <F5> zc   <CR> " toggle line numbers   " Fold
 nnoremap <S-F5> zM <CR> " toggle line numbers   " Fold all
 nnoremap <C-F5> zM <CR> " toggle line numbers   " Fold all
 nnoremap <F6> zo   <CR> " toggle line numbers   " Un-fold
 nnoremap <S-F6> zR <CR> " toggle line numbers   " Un-fold all
 nnoremap <C-F6> zR <CR> " toggle line numbers   " Un-fold all

" nnoremap <C-S-s> :w !sudo tee % > /dev/null <CR> " Save as admin
