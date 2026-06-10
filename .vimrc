" 4ctiv's vim config (Note: " marks a comment)

"""Core Settings"""

" Enable plugins
" filetype plugin on
 execute 'packadd YouCompleteMe'
 execute 'packadd ale'
 execute 'packadd linuxsty'

" ALE Settings
 let g:ale_hover_to_preview = 1
 set updatetime=1500 " in ms

" Specify linters
let g:ale_linters = {
\   'go': ['golint']
\}

" Specify formatters
let g:ale_fixers = {
\   'go': ['gofmt']
\}

" Enable auto-formatting on save
let g:ale_fix_on_save = 1

" Vim not reporing as "vi"
" [Reference](https://www.youtube.com/watch?v=XA2WjJbmmoM)
 set nocompatible

" Vim grep recursive on codebase
" `:copen` ~ navigation menu for matches
"   - `:cc nr` ~ jump to specific find
 set grepprg=rg\ --line-number\ --column
 set grepformat=%f:%l:%c:%m
 command! -nargs=+ Rg
      \ tabnew |
      \ execute 'silent grep ' . <q-args> |
      \ copen

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

 function! s:SearchGitRepo()
   let l:root = system('git rev-parse --show-toplevel 2>/dev/null')->trim()
   if empty(l:root)
     let l:root = getcwd()
   endif

   execute 'lcd' fnameescape(l:root)
   execute 'Rg ' . shellescape(input('Search term: '))
 endfunction

" Auto Indentation
"" Folding  https://www.vimfromscratch.com/articles/vim-folding
 setlocal foldmethod=indent "syntax marker indent
 setlocal nofoldenable

"" Code Formating
" https://www.cs.swarthmore.edu/oldhelp/vim/reformatting.html
 set formatoptions=tcq

" Code Indentation
" [Reference](https://vim.fandom.com/wiki/Indenting_source_code#Methods%20for20automatic20indentation)
 set expandtab    " Always insert spaces instead of tabs
 set tabstop=2    " Note: softtabstop ~ local ; tabstop ~ global
 set shiftwidth=2 " Tab ~ 2 Spaces
 if has("autocmd")
   " Load vim config based on filetype (`~/.vim/ftplugin/*.vim`)
   filetype plugin indent on
 endif

"""Theme"""
 set termguicolors    " 24-bit color
 colorscheme sorbet   " rosepine -> ~/.vim/colors/THEME.vim
 let g:disable_bg=1                " transparent background
 augroup TransparentBG
   autocmd!
   autocmd ColorScheme * hi Normal guibg=NONE ctermbg=NONE
 augroup END

" ALE Hover memu
 highlight Pmenu guibg=#3a3a3a guifg=#efefef

" Font (mono with ligerature)
 set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h16,monospace:h16

" Line numbers
 set number
 set relativenumber " relavive line Nr.

" Syntax Highlighting
 syntax enable

" Highlight special characters
" Test (3 spaces,1 tab, 1 space):   	 
set listchars=tab:⋅⋅,trail:␣,extends:>,precedes:<
"set listchars+=space:␣,eol:$
 set list

" Git Conflict highlighting
" -> https://midnighthax.com/resolve-git-rebase-merge-conflicts-vim/
augroup MyColors
  autocmd!
  autocmd BufEnter * call s:conflicts_highlight()
augroup END

function! s:conflicts_highlight() abort
  syn region conflictStart  start=/^<<<<<<< .*$/ end=/^\ze\(||||||| \|=======\)/
  syn region conflictMiddle start=/^||||||| .*$/ end=/^\ze=======$/
  syn region conflictEnd    start=/^=======$/     end=/^>>>>>>> .*$/

  highlight conflictStart  guibg=#90ee90 guifg=#000000
  highlight conflictMiddle guibg=#F49BAB guifg=#000000
  highlight conflictEnd    guibg=#ffb6c1 guifg=#000000
endfunction

" Menus
 set wildmenu
 set path+=**


"""Features"""

 " Markdown viewer
 function! Open_Glow_Right_Split()
  "if !executable('glow') | return | endif
   if !executable('glow')
     if executable('snap')
       " Linux
       rightbelow vertical terminal ++close bash -c "echo 'Installing glow (via snap)' && sudo snap install glow"
     elseif executable('winget')
       " Windows
       rightbelow vertical terminal ++close bash -c "winget install glow"
     elseif executable('pkg')
       " Android
       rightbelow vertical terminal ++close bash -c "pkg install glow"
     else
       return
     endif
   endif

   set nolist
   rightbelow vertical terminal ++close bash -c "glow -p \"%\""
   let l:term = bufnr('%')
   wincmd h | set list

   " Auto refresh on save
   execute 'autocmd BufWritePost <buffer> if bufexists(' . l:term . ') | silent! call term_sendkeys(' . l:term . ', "glow % \<CR>") | endif'

   " Clean up when closing
   execute 'autocmd BufWinLeave <buffer> if bufexists(' . l:term . ') | bd! ' . l:term . ' | endif'
 endfunction


"""WARNINGS"""

" Line number color based on vim mode
" Note: Visual mode has no events on enter/leave
 autocmd InsertLeave * highlight LineNr ctermfg=NONE    guibg=black
"autocmd VisualLeave * highlight LineNr ctermfg=yellow  guibg=black

 autocmd InsertEnter * highlight LineNr ctermfg=darkred guibg=darkred
"autocmd VisualEnter * highlight LineNr ctermfg=cyan    guibg=darkcyan

" File Read Only (warning)
 set confirm
 augroup FileWritableCheck
   autocmd!
   autocmd BufReadPost * if filereadable(expand('%')) && !filewritable(expand('%')) | echohl WarningMsg | echo "Warning: File is not writable!" | echohl None | endif
 augroup END

"""HOTKEYS"""
" <S-...> Shift ; <M-...> Alt ; <C-...> Strg ; <...>[1;53s AltGr
"NOTE: MAC maynot work with <A-...>, use [ALT] + [KEY] resulting letter instead

"Remap vim autocomplete ([CTRL]+[N] -> [CTRL]+[Shift]+[SPACE])
 inoremap <C-S-Space> <C-n>

"Quick escape insert mode ([Space]+[Space] -> [ESC])
"Given qq is not part of natural language this should be sufficant
"NOTE: 'nmap qq' slows down macro recording save q<Letter> -> macro -> q
 nmap qq a
 imap <nowait> qq <Esc>

"Save as admin (usefull if opened user has no rw rights)
"NOTE: [CTRL] + [S] + [_] is somewhat unreliable
 nnoremap <M-S-S> :w !sudo tee % > /dev/null<CR>:e!<CR> " Save file as admin

"nnoremap   <F1> :help <CR>                      " open help page
 nnoremap   <F1> :Explore <CR>                   " File browser
 nnoremap <silent> <F2> :set number! relativenumber! list! <Bar> let &signcolumn = (&signcolumn ==# 'no' ? 'auto' : 'no') <Bar> ALEToggle <CR> " hide most helper (easy select & copy)
 nnoremap   <F3> :set wrap! <CR>                 " toggle line wrap
 nnoremap   <F4> :<C-u>retab!<CR>:keepjumps keeppatterns %s/\s\+$//e<CR> " replace tabs & remove trailing whitespace

"nnoremap   <F5>  gg=G <CR>                       " Format file
 nnoremap   <F6> :call <SID>SearchGitRepo()<CR>
 xnoremap   <F6> :call <SID>SearchGitRepo()<CR>
 nnoremap   <F7>  zc   <CR>                       " Fold
 nnoremap <S-F7>  zM   <CR>                       " Fold all
 nnoremap <C-F7>  zM   <CR>                       " Fold all
 nnoremap   <F8>  zo   <CR>                       " Un-fold
 nnoremap <S-F8>  zR   <CR>                       " Un-fold all
 nnoremap <C-F8>  zR   <CR>                       " Un-fold all

"NOTE: ALE... looks up references on whole (git) project
 nnoremap   <F9>  :ALEGoToTypeDefinition   <CR>   " Type     Declaration
 nnoremap   <F10> :ALEGoToDefinition       <CR>   " Var/Func Declaration
 nnoremap   <F11> :tab split<CR> :ALEFindReferences <CR>   " List usages
"nnoremap <C-F10> <C-O>                           "  Jump back (decl)
"nnoremap <S-F10> <C-O>                           "  Jump back (decl)
"nnoremap <C-F11> <C-O>                           "  Jump back (def)
"nnoremap <S-F11> <C-O>                           "  Jump back (def)

 nnoremap <C-p>   :call Open_Glow_Right_Split()<CR> " Render Markdown (Switch view via `[CTRL] + [W] + [W]`)

 " Language & Codeing Style overides
 "NOTE: You can use `:setfiletype` instead of `:set syntax=` to also use
 "      language features (e.g. indentation)
 noremap <M-S-r> :set syntax=ON <CR>             " Set syntax to automatic detection
 noremap <M-S-b> :set syntax=bash <CR>           " Set syntax to bash (common linux script language)
 noremap <M-S-j> :set syntax=json5 <CR>          " Set syntax to json5
 noremap <M-S-y> :set syntax=yaml <CR>           " Set syntax to yaml
 noremap <M-S-m> :set syntax=markdown <CR>       " Set syntax to markdown
 noremap <M-S-p> :set syntax=ps1 <CR>            " Set syntax to powershell
 noremap <M-S-x> :set syntax=xml <CR>            " Set syntax to xml (~html)

 nnoremap <silent> <M-S-l> :LinuxCodingStyle<CR> " Emable Linux Coding Style plugin

