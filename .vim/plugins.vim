call plug#begin('~/.vim/plugged')
  Plug 'w0rp/ale'
  Plug 'rizzatti/dash.vim'
  Plug 'soramugi/auto-ctags.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-fugitive'
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
  Plug 'ryanolsonx/vim-lsp-typescript'
  Plug 'ryanolsonx/vim-lsp-javascript'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'prabirshrestha/asyncomplete-ultisnips.vim'

  " Lazy loading
  Plug 'tpope/vim-rails', {'for': 'ruby'}
call plug#end()
