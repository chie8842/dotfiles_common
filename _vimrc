filetype plugin indent on

"ファイルタイプに応じて挙動,色を変える
syntax on
filetype plugin on
filetype indent on

"==============================================
" settings for appearance
"==============================================

set background=dark
" colorscheme monokai
" set t_Co=256
" 行番号,ルーラーを表示
set number
set ruler
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 不可視文字を可視化
"set list
set list listchars=tab:\▸\-,extends:↓,precedes:«,trail:-,eol:↩
" 括弧の対応をハイライト
set showmatch
" ウインドウタイトルを設定する
set title

"-------Tab系--------
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" オートインデント
set smartindent
set autoindent
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
" FileTypeがpythonの場合のタブ設定
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

"-------拡張--------
"カーソルラインを派手にする
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

"completeoptの背景色をグレーにする
highlight Pmenu ctermbg=8
highlight PmenuSel ctermbg=Green
highlight PmenuSbar ctermbg=Green
"80文字目より右の背景を薄くする
let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermbg=235 guibg=#2c2d27 

"折返しする
set wrap

"矢印キーでは表示行単位で行移動する
nmap <UP> gk
nmap <DOWN> gj
vmap <UP> gk
vmap <DOWN> gj

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

"JSONを整形する
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

"ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"==============================================
" settings for ui
"==============================================

"ターミナルでマウスを使用できるようにする
if has ("mouse")
"    set mouse=a
  set guioptions+=a
  set ttymouse=xterm2
endif

" 共通的な設定の読み込み
runtime! settings/common/*.vim
" プラグイン固有の設定の読み込み
runtime! settings/plugins/*.vim
