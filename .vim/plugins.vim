call plug#begin('~/.vim/plugged')
  Plug 'dense-analysis/ale'
  Plug 'rizzatti/dash.vim'
  Plug 'soramugi/auto-ctags.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf'
  Plug 'scrooloose/nerdtree'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-commentary'
  Plug 'cohama/lexima.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'maximbaz/lightline-ale'
  Plug 'cocopon/iceberg.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'majutsushi/tagbar'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/asyncomplete-tags.vim'

  " Lazy loading
  Plug 'tpope/vim-rails', {'for': 'ruby'}
call plug#end()
