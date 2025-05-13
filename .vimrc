" 4ctiv's vim config (Note: " marks a comment)

" Set Font with ligerature
 set guifont=JetBrainsMono\ Nerd\ Font\ Mono

" Relative line numbers
 set number
 set relativenumber

" Code Indentation
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

" Code Formating
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

" Show read only warning
 set confirm
 augroup FileWritableCheck
   autocmd!
   autocmd BufReadPost * if filereadable(expand('%')) && !filewritable(expand('%')) | echohl WarningMsg | echo "Warning: File is not writable!" | echohl None | endif
 augroup END

" HOTKEYS
" <S-...> Shift ; <A-...> Alt ; <C-...> Strg ; <...>[1;53s AltGr

"nnoremap <F1> :help <CR>                        " open help page
 nnoremap <F2> :set number! relativenumber! <CR> " toggle line numbers
 nnoremap <F3> :retab <CR>                       " Replace tabs with spaces
 nnoremap <F4> :Rexplore <CR>                    " File browser
"nnoremap <F4> gg=G <CR>                         " Format file

 nnoremap <F5> zc   <CR>                         " Fold
 nnoremap <S-F5> zM <CR>                         " Fold all
 nnoremap <C-F5> zM <CR>                         " Fold all
 nnoremap <F6> zo   <CR>                         " Un-fold
 nnoremap <S-F6> zR <CR>                         " Un-fold all
 nnoremap <C-F6> zR <CR>                         " Un-fold all

" nnoremap <C-S-s> :w !sudo tee % > /dev/null <CR> " Save as admin
