"===================================================================
" Basic Settings
"===================================================================
source ~/.vim/plugins.vim
set nocompatible "vi互換モードを無効化
syntax on "シンタックスハイライト有効
set nofixeol
set ambiwidth=double
set splitbelow "垂直分割時、ウインドウを下に分割
set splitright "水平分割時、ウインドウを右に分割
set nostartofline "行の移動時、行頭に移動しない
set confirm "バッファが変更されている時、コマンドエラーではなく確認を返す
set visualbell "ビープ音の代わりに画面フラッシュを使用する
set t_vb= "画面フラッシュも無効にする
set mouse=a "全モードでマウス有効化
set clipboard=unnamed "クリップボードからコピーできるようにする
set wildmode=list:longest,full "tabで確定部分まで入力、リストを表示してtabでトグル
set hidden "バッファを保存せずに新しいバッファを開く
set backspace=indent,eol,start "BSでインデント、改行、挿入モード開始位置以前の文字を削除可能にする
set noswapfile "swapファイルを作成しない
set nobackup "バックアップファイルを作成しない
set notitle
set noundofile "アンドゥファイルを作成しない"
set completeopt=menuone "補完の結果をプレビューさせない
set clipboard=unnamed
set textwidth=0
au BufNewFile,BufRead *.vue set filetype=vue
au BufNewFile,BufRead *.ts set filetype=typescript
set encoding=utf-8
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,sjis,latin1 "日本語自動識別用設定
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
let g:auto_ctags_tags_args = '--tag-relative=yes --recurse --sort=yes'
let g:sql_type_default = 'mysql'

if !has('nvim')
  packadd matchit
endif

"===================================================================
" Keymap
"===================================================================
let mapleader="\<Space>"
" ESCでターミナル終了
tnoremap <ESC> <C-W>:q!<CR>
"ESCで検索ハイライトを消す
nnoremap  <silent> <Esc> :nohlsearch<CR><Esc>
"タグジャンプの候補が複数ある場合はリストを出す
nnoremap <C-]> g<C-]>
"xで削除した文字をヤンクしない
nnoremap x "_x
vnoremap x "_x
nmap <silent> <leader>d <Plug>DashSearch
" Split window
nmap ss :split<Return>
nmap sv :vsplit<Return>
" Move window
map mh <C-w>h
map mk <C-w>k
map mj <C-w>j
map ml <C-w>l

"===================================================================
" Search
"===================================================================
set ignorecase "大文字小文字を区別せずに検索
set smartcase "大文字が含まれているときは区別して検索する
set incsearch "インクリメンタルサーチを有効化
set hlsearch "検索結果をハイライト
set wrapscan "最後まで検索したら一番上に戻る
set showcmd "入力中のコマンドを最下行に表示


"===================================================================
" Appearance
"===================================================================
set t_ut=
set number "行番号を表示
set ruler "ルーラー表示
set laststatus=2 "ステータスラインを常に表示
set list "不可視文字を表示する
set colorcolumn=80 "80文字目に目印
set listchars=tab:>-,trail:-,eol:↲ "不可視文字の設定内容
set cmdheight=2 "コマンド行の高さを2行に設定
"JSONのダブルクオーテーションマークを表示する
autocmd Filetype json setl conceallevel=0
".jsファイルでもJSXをハイライト
let g:jsx_ext_required = 0
"markdownファイルでconceal無効化
let g:vim_markdown_conceal = 0
autocmd Filetype markdown setl conceallevel=0

if &term == 'screen-256color'
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif

set termguicolors
set background=dark
colorscheme iceberg


"===================================================================
" CoC
"===================================================================
nmap <silent> <leader>h :<C-U>call CocAction('doHover')<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lr <Plug>(coc-references)


"===================================================================
" ALE
"===================================================================
let g:ale_set_highlights = 0
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = "X"
let g:ale_sign_warning = "!"
let g:ale_linters = {
\   'ruby': ['ruby', 'rubocop'],
\   'php': ['php', 'phpcs'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'vue': ['eslint'],
\   'go': ['gometalinter', 'gofmt'],
\   'css': ['stylelint'],
\   'scss': ['stylelint']
\}
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'vue': ['eslint'],
\   'go': ['gofmt']
\}
let g:ale_php_phpcs_standard = 'PSR2'
let g:ale_go_gometalinter_options = '--fast'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"===================================================================
"NERD Tree
"===================================================================
nnoremap <silent><leader>n :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<space>'
let NERDTreeShowHidden = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1


"===================================================================
" fzf
"===================================================================
set rtp+=/usr/local/opt/fzf
"ファイル検索
nmap <leader>ff :Files<CR>
"バッファ検索
nmap <leader>fb :Buffers<CR>
"タグ検索
nmap <leader>ft :Tags<CR>
"ファイル履歴検索
nmap <leader>fh :History<CR>
"コマンド履歴検索
nmap <leader>fc :History:<CR>
"Rg
nmap <leader>fr :Rg<CR>

" Rg with preview
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --line-number --no-heading --color=auto --smart-case '.shellescape(<q-args>),
  \   0,
  \   fzf#vim#with_preview({'options': '-e --delimiter : --nth 3..'}, 'right:60%'),
  \   <bang>0)

" Files command with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:60%'), <bang>0)


"===================================================================
"Lightline.vim
"===================================================================
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'right': [ [ 'fileencoding' ],
      \              [ 'lineinfo' ],
      \              [ 'linter_checking', 'linter_errors', 'linter_warnings' ] ],
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ],
      \             [ 'fugitive' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head") && ""!=fugitive#head()?"\uE0A0 " . fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_checking': 'left',
      \ },
      \ 'separator': { 'left': "\uE0B8", 'right': "\uE0BA" },
      \ 'subseparator': { 'left': "\uE0B9", 'right': "|" }
      \ }


"===================================================================
" PHP
"===================================================================
" 文字列中のSQLをハイライト
let php_sql_query           = 1
" Baselibメソッドのハイライト
let php_baselib             = 1
" 文字列中のHTMLをハイライト
let php_htmlInStrings       = 1
" <? をハイライト除外にする
let php_noShortTags         = 1
" カッコが閉じていない場合にハイライト
let php_parent_error_close  = 1
" SQLのシンタックスハイライトをMySQLにする
let g:sql_type_default = 'mysql'


"===================================================================
" Markdown
"===================================================================
let g:vim_markdown_folding_disabled = 1
let g:previm_open_cmd = "open -a \"Google Chrome\""
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END


"===================================================================
" UltiSnips
"===================================================================
let g:UltiSnipsSnippetsDir = 'Snips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'Snips']
let g:UltiSnipsEnableSnipMate = 0
