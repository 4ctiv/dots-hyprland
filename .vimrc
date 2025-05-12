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

" Code folding
" use `zc`/`zM` to fold ; `zo`/`zR` to open
set foldmethod=indent
set foldnestmax=10
set foldlevel=2
set nofoldenable
" Syntax Highlighting
 syntax on
 setlocal foldmethod=indent "syntax
 setlocal nofoldenable

" Change line number color based on vim mode
"  (Note: Visual mode has no events on enter/leave)
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
" :w !sudo tee % > /dev/null
"nnoremap <S-C-s> :w !sudo tee % > /dev/null     " Shift+Ctrl+S: Save as admin

 nnoremap <F5> :set number! relativenumber! <CR> " toggle line numbers
 nnoremap <F6> gg=G <CR> " toggle line numbers   " Auto indent file
 nnoremap <F3> zm   <CR> " toggle line numbers   " Auto indent file
 nnoremap <F4> zr   <CR> " toggle line numbers   " Auto indent file
