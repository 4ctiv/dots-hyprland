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
 set listchars=tab:—⇥
"set listchars+=space:␣
 set listchars+=trail:␣,extends:…,precedes:…
"set listchars=eol:↵
 set list

" Syntax Highlighting
 syntax on

" list test
	  ; 
