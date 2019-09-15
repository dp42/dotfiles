call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
  Plug 'w0rp/ale'
  Plug 'rizzatti/dash.vim'
  Plug 'soramugi/auto-ctags.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-commentary'
  Plug 'cohama/lexima.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'maximbaz/lightline-ale'
  Plug 'cocopon/iceberg.vim'
  Plug 'SirVer/ultisnips'
  Plug 'sheerun/vim-polyglot'
  Plug 'honza/vim-snippets'

  " Lazy loading
  Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'javascript.jsx']}
  Plug 'posva/vim-vue', {'for': 'vue'}
  Plug 'tpope/vim-rails', {'for': 'ruby'}
call plug#end()
