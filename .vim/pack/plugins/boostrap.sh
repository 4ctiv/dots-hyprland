#!/bin/bash

# OPTIONAL
git clone --depth 1 https://github.com/vivien/vim-linux-coding-style ~/.vim/pack/plugins/opt/linux-kernel
git clone --depth 1 https://github.com/tpope/vim-fugitive  ~/.vim/pack/plugins/opt/git
# STARTUP
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/plugins/start/linter
git clone --depth 1 https://github.com/ycm-core/YouCompleteMe ~/.vim/pack/plugins/start/completer
git clone --depth 1 https://github.com/preservim/tagbar ~/.vim/pack/plugins/start/outline
git clone --depth 1 https://github.com/junegunn/fzf.vim ~/.vim/pack/plugins/start/fzf

# DEPENDENCIES
OLD_DIR="$(pwd)"
  cd '~/.vim/pack/plugins/opt/completer' && git submodule update --init --recursive && python3 install.py --all

  answer="";
  while ! [[ "$answer" =~ ^([Yy](es)?|[Nn](o)?)$ ]]; do
    read -r -p "Do you want to make changes to the system? (ctags, fzf, rg) [y/N] " answer;
  done
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    which "ctags" || { git clone --depth 1 https://github.com/universal-ctags/ctags.git ~/.vim/pack/deps/ctags && ./autogen.sh && ./configure && make && sudo make install; }
    which "fzf"   || { git clone --depth 1 https://github.com/junegunn/fzf.git ~/.vim/pack/deps/fzf && ~/.vim/pack/deps/fzf/install; }
    which "rg"    || { git clone --depth 1 https://github.com/BurntSushi/ripgrep ~/.vim/pack/deps/rg && cargo build --release; }
  fi
cd "${OLD_DIR:?}"
exit 0

