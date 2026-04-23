" 4ctiv's vim config (Note: " marks a comment)

"""Core Settings"""

" Enable plugins
"filetype plugin on

" Vim not reporing as "vi"
" [Reference](https://www.youtube.com/watch?v=XA2WjJbmmoM)
 set nocompatible

" Default Shell
" This is relevant for e.g. :! or :shell
 set shell=/bin/bash

" Show status bar
 set laststatus=2

" Show code ruler
 set colorcolumn=81
 highlight ColorColumn ctermbg=232

" Splits
 set splitbelow " open on bottom

" Cursor
 set scrolloff=5     " min 3 lines of padding (view)

" Mouse
 set mouse=a         " Mouse scrolling without cursor

" Search
 set hlsearch
 set incsearch            " Sow matches while typing
 set ignorecase
 set smartcase            " Upper cases enforced in search

" Auto Indentation
"" Folding  https://www.vimfromscratch.com/articles/vim-folding
 setlocal foldmethod=indent "syntax marker indent
 setlocal nofoldenable

"" Code Formating
" https://www.cs.swarthmore.edu/oldhelp/vim/reformatting.html
 set formatoptions=tcq

" Code Indentation
" [Reference](https://vim.fandom.com/wiki/Indenting_source_code#Methods%20for20automatic20indentation)
 if has("autocmd")
   " Load indent files, to automatically do language-dependent indenting.
   " Configuration Files: `~/.vim/after/ftplugin/EXTENSION_TYP.vim`
   " filetype plugin indent on
 endif
 set expandtab    " Always insert spaces instead of tabs
 set shiftwidth=2 " Tab ~ 2 Spaces
 set tabstop=2 " Note: softtabstop ~ local ; tabstop ~ global


"""Theme"""
 set termguicolors    " 24-bit color
 colorscheme sorbet   " rosepine -> ~/.vim/colors/THEME.vim
 let g:disable_bg=1                " transparent background
 augroup TransparentBG
   autocmd!
   autocmd ColorScheme * hi Normal guibg=NONE ctermbg=NONE
 augroup END

" Font (mono with ligerature)
 set guifont=JetBrainsMono\ Nerd\ Font\ Mono

" Line numbers
 set number
 set relativenumber " relavive line Nr.

" Syntax Highlighting
 syntax enable
 set syntax=on

" Highlight special characters
" Test (3 spaces,1 tab, 1 space):   	 
 set listchars=tab:>>,trail:␣,extends:>,precedes:<
"set listchars+=space:␣,eol:$
 set list

" Highlight Git Conflicts (broken)
"highlight GitConflict ctermbg=red ctermfg=white guibg=#ff0000 guifg=#ffffff
"syntax match GitConflict /^<[<]+.*$/
"syntax match GitConflict /^=======$/
"syntax match GitConflict /^>[>]+.*$/

" Conflict highlighting
" -> https://midnighthax.com/resolve-git-rebase-merge-conflicts-vim/
augroup MyColors
  autocmd!
  autocmd BufEnter * call s:conflicts_highlight()
augroup END

function! s:conflicts_highlight() abort
  syn region conflictStart  start=/^<<<<<<< .*$/ end=/^\ze\(||||||| \|=======\)/
  syn region conflictMiddle start=/^||||||| .*$/ end=/^\ze=======$/
  syn region conflictEnd    start=/^=======$/     end=/^>>>>>>> .*$/

  hi conflictStart  guibg=#90ee90 guifg=#000000
  hi conflictMiddle guibg=#F49BAB guifg=#000000
  hi conflictEnd    guibg=#ffb6c1 guifg=#000000
endfunction

" Menus
 set wildmenu
 set path+=**


"""Features"""

" Markdown render view
 function! Open_Glow_Right_Split()
   if !executable('glow') | return | endif
   set nolist
   rightbelow vertical terminal bash -c "glow -p \"%\""
   let l:term = bufnr('%')
   wincmd h | set list

   " Auto refresh on save
   execute 'autocmd BufWritePost <buffer> if bufexists(' . l:term . ') | silent! call term_sendkeys(' . l:term . ', "glow %\<CR>") | endif'

   " Clean up when closing
   execute 'autocmd BufWinLeave <buffer> if bufexists(' . l:term . ') | bd! ' . l:term . ' | endif'
 endfunction


"""WARNINGS"""

" Line number color based on vim mode
" Note: Visual mode has no events on enter/leave
 autocmd InsertLeave * highlight LineNr ctermfg=NONE   guibg=black
"autocmd VisualLeave * highlight LineNr ctermfg=yellow guibg=black

 autocmd InsertEnter * highlight LineNr ctermfg=red    guibg=red
"autocmd VisualEnter * highlight LineNr ctermfg=cyan   guibg=darkcyan

" File Read Only (warning)
 set confirm
 augroup FileWritableCheck
   autocmd!
   autocmd BufReadPost * if filereadable(expand('%')) && !filewritable(expand('%')) | echohl WarningMsg | echo "Warning: File is not writable!" | echohl None | endif
 augroup END

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

 nnoremap <C-p> :call Open_Glow_Right_Split()<CR> " Render Markdown (Switch views using `[CTRL] + [W] + [W]`)

 nnoremap <M-S-S> :w !sudo tee % > /dev/null<CR>:e!<CR> " Save file as admin

 " Syntax highlight overides
 " NOTE: You can use `:setfiletype` instead of `:set syntax=` to also use
 noremap <M-S-r> :set syntax=ON <CR>             " Set syntax to automatic detection
 noremap <M-S-b> :set syntax=bash <CR>           " Set syntax to bash (common linux script language)
 noremap <M-S-j> :set syntax=json5 <CR>          " Set syntax to json5
 noremap <M-S-y> :set syntax=yaml <CR>           " Set syntax to yaml
 noremap <M-S-m> :set syntax=markdown <CR>       " Set syntax to markdown
 noremap <M-S-p> :set syntax=ps1 <CR>            " Set syntax to powershell
 noremap <M-S-x> :set syntax=xml <CR>            " Set syntax to xml (~html)


