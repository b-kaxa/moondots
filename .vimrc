" エンコーディング
set encoding=utf-8

" 構文ごとに色分け
syntax on

" 行番号表示
set number

" tabのスペース数
set tabstop=4

" 改行時に自動インデント
set autoindent

" 改行したら一段深くインデント
set smartindent

" タブを空白にする
set expandtab

" インデントの空白数 （自動挿入）
set shiftwidth=4

" インデントの空白数（tabを押した時）
set softtabstop=4

" ペーストするときにインデントをずれを起こさない
set paste

" 256色モード
set t_Co=256

" カーソル行をハイライトする
set cursorline

" マウス有効
set mouse=a

" 改行時インデント継続
set autoindent

" emacs key bind
noremap <C-a> <HOME>
noremap <C-e> <END>
noremap <C-p> <UP>
noremap <C-n> <DOWN>
noremap <C-b> <LEFT>
noremap <C-f> <RIGHT>

" 各ファイルごとの設定
augroup fileTypeIndent
	autocmd!
	autocmd BufNewFile,BufRead *.json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END
