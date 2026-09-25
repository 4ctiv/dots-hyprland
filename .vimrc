" 4ctiv's vim config (Note: " marks a comment)
"
" NOTICE FOR NEW VIM USERS
" vim Script Syntax has only full line comments
" meaning e.g. `:someCommand " descripton` would
" have NO comment but is a single command
" In most cases this is still fine but sometimes
" breaks functionality and introduces wered behaviour
" you have been warned ;)

"==============================================================================
" CORE SETTINGS

" Enable plugins
"filetype plugin on
"execute 'packadd linuxsty' " linuix kernel formatting

" YCM Completion-menu
set completeopt=menuone

" =====================================
" Plugin Settings

" ALE preview
 let g:ale_hover_to_preview = 1
 set updatetime=3000 " in ms

" ALE Specify formatters
 let g:ale_fixers = {
 \   'c': ['clang-format','clangtidy'],
 \   'cpp': ['clang-format','clangtidy'],
 \}
" ALE formatter args
let g:ale_cpp_clangformat_options = '-style="{BasedOnStyle: llvm, ColumnLimit: 80, TabWidth: 4}"'

" ALE Specify linters -> `:ALEInfo`
 let g:ale_linters = {
 \   'c':  ['clangd'],
 \   'cpp' : ['clangd'],
 \   'yaml': ['yamllint'],
 \   'python': ['ruff'],
 \}
" ALE linter args
 let g:ale_yaml_yamllint_options = '-d "{extends: default, rules: {line-length: {level: warning}}}"'
 let g:ale_python_ruff_type_map = {'E501': 'W'}
 let g:ale_cpp_clangd_options = '-std=c++20'

" ALE auto-format on save
 let g:ale_fix_on_save = 1
 let g:ale_completion_enabled = 1
 let g:ale_warn_about_trailing_whitespace = 1

" FZF
 let g:fzf_preview_window = ['right:60%', 'ctrl-/']
 let g:fzf_layout = {
  \ 'window': {
    \ 'width': 0.95,
    \ 'height': 0.85
  \ }
  \}

" Vim not reporing as "vi"
" [Reference](https://www.youtube.com/watch?v=XA2WjJbmmoM)
 set nocompatible

" Default Shell
" This is relevant for e.g. :! or :shell
 if executable('/bin/fish')
 set shell=/bin/fish
else
   set shell=/bin/bash
endif

" Show status bar
 set laststatus=2

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
 set expandtab    " Always insert spaces instead of tabs
 set tabstop=2    " Note: softtabstop ~ local ; tabstop ~ global
 set shiftwidth=2 " Tab ~ 2 Spaces
 if has("autocmd")
   " Load vim config based on filetype (`~/.vim/ftplugin/*.vim`)
   filetype plugin indent on
 endif

"==============================================================================
" THEME

 set termguicolors     " 24-bit color
 let hour = strftime("%H")
 if (7 <= hour && hour <= 17)
   " blueish colors day-time
   colorscheme sorbet   " sorbet -> built in
  "colorscheme rosepine " rosepine -> custom (~/.vim/colors/rosepine.vim)
 else
   " redish colors night-time
   colorscheme ayu      " ayu -> custom (~/.vim/colors/ayu.vim)
 endif

 let g:disable_bg=1    " transparent background
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

" Line width ruler(-s)
 set colorcolumn=81,101,121
 highlight ColorColumn ctermbg=232

" Syntax Highlighting
 syntax enable

" Highlight special characters
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


"==============================================================================
" HELPER FUNCTIONS

 function! s:SearchGitRepo(s_type)
   " goto git root
   let l:root = system('git rev-parse --show-toplevel 2>/dev/null')->trim()
   if empty(l:root)
     let l:root = getcwd()
   endif

   execute 'lcd' fnameescape(l:root)

   " str compare: https://vimhelp.org/eval.txt.html#expr-%3C
   if trim(a:s_type) is? "rg" || empty(a:s_type)
    "let search = input('Search string: ')
    "if search == ''
    "  echo "\nERROR: Empty search string"
    "  return
    "endif
    "execute 'Rg ' . shellescape(search)
     execute 'RG '
   elseif trim(a:s_type) is? "fzf"
     " execute 'FZF ' . system('git rev-parse --show-toplevel 2>/dev/null')[:-2]
     execute 'Files '
   endif
 endfunction

 " Toggle CursorHold Commands
 " e.g. YCM info popup
 function! ToggleCursorHold()
    if &eventignore =~# '\<CursorHold\>'
        set eventignore-=CursorHold
    else
        set eventignore+=CursorHold
    endif
 endfunction
 command! ToggleCursorHold call ToggleCursorHold()

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

"==============================================================================
" WARNINGS

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

"==============================================================================
" HOTKEYS
" <S-...> Shift ; <A-...> Alt(gr) ; <M-...> Meta (= Alt); <C-...> Strg

"======================================
" Visual Extensions

" Render Markdown (Switch view via `[CTRL] + [W] + [W]`)
 nnoremap <C-p>   :call Open_Glow_Right_Split()<CR>

" Toggle file outline (required plugin: tagbar)
 nnoremap <C-l>   :TagbarToggle <CR>

"======================================
" Special behaviour

"NOTE: MAC maynot work with <A-...>, use [ALT] + [KEY] resulting letter instead

"Remap vim autocomplete ([CTRL]+[N] -> [CTRL]+[Shift]+[SPACE])
 inoremap <C-S-Space> <C-n>

"Quick escape insert mode ([Space]+[Space] -> [ESC])
"Given qq is not part of natural language this should be ok
"NOTE: 'nmap qq' slows down macro recording save q<Letter> -> macro -> q
 nmap qq a
 imap <nowait> qq <Esc>

"Copy selection to clipboard (wayland)
"-> https://stackoverflow.com/questions/61379318
 xnoremap <silent> <C-c> :w !wl-copy <CR> <CR>
 xnoremap <silent> <C-x> y:call system('wl-copy', @@)<CR>gvd

"Save as admin (usefull if opened user has no rw rights)
"NOTE: [CTRL] + [S] + [_] is somewhat unreliable
 nnoremap <M-S-S> :w !sudo tee % > /dev/null<CR>:e!<CR> " Save file as admin

"======================================
" Function Keys

 nnoremap   <F1> :Texplore <CR>                  " File browser (new tab)
 nnoremap <S-F1> :Explore  <CR>                  " File browser (same tab)
 " hide most helper (easy select & copy)
 nnoremap <silent> <F2> :set number! relativenumber! list! <Bar>
       \ let &signcolumn = (&signcolumn ==# 'no' ? 'auto' : 'no') <Bar>
       \ ALEToggle <Bar> ToggleCursorHold <CR>
 " toggle line wrap
 nnoremap <silent> <F3> :set wrap! <CR>
 " Fix common formatting issues
 nnoremap <silent> <F4> :<C-u>retab!<CR>:keepjumps keeppatterns %s/\s\+$//e<CR>
"=====
"Folding (At Cursor: [ZA]lternate, [ZC]lose, [ZO]pen ; [zM]fold [zR]unfold)
 nnoremap   <F5>  zc   <CR>
 nnoremap <S-F5>  zM   <CR>
 nnoremap   <F6>  zo   <CR>
 nnoremap <S-F6>  zR   <CR>
" Jump (o: back ; i: forward)
 nnoremap   <F7> <C-o>
 nnoremap   <F8> <C-i>
"=====
"NOTE: ALE... looks up references on whole (git) project
 nnoremap   <F9>  :ALEGoToDefinition -split      <CR>
 nnoremap <S-F9>  :ALEGoToDefinition             <CR>
 nnoremap <C-F9>  :ALEGoToTypeDefinition -split  <CR>
 nnoremap   <F10> :ALEFindReferences -split      <CR>
 nnoremap <S-F10> :ALEFindReferences             <CR>
 nnoremap   <F11> :call <SID>SearchGitRepo('rg') <CR>
 nnoremap <S-F11> <C-O>
 nnoremap   <F12> :call <SID>SearchGitRepo('fzf')<CR>
 nnoremap <S-F12> <C-O>

"======================================
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

"===============================================================================
" Other

