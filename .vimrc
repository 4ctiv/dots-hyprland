" 4ctiv's vim config (Note: " marks a comment)

" Set Font with ligerature
set guifont=JetBrainsMono\ Nerd\ Font\ Mono

" Relative line numbers
 set number
 set relativenumber

" Tab |-> 2 spaces
 filetype indent on "fix indentation with 'gg=G' (normal mode)
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

" Change line number color based on vim mode
"  (Note: Visual mode has no events on enter/leave)
 autocmd InsertLeave * highlight LineNr ctermfg=yellow guibg=black
"autocmd VisualLeave * highlight LineNr ctermfg=yellow guibg=black

 autocmd InsertEnter * highlight LineNr ctermfg=red    guibg=red
"autocmd VisualEnter * highlight LineNr ctermfg=cyan   guibg=darkcyan
