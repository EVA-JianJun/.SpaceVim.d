" 启动自动全屏
" autocmd GUIEnter * simalt ~x
call rpcnotify(0, 'Gui', 'WindowMaximized', 1)

" 主题设置
let g:neodark#background = '#202020'

" 让光标始终保持在屏幕中间
autocmd! CursorMoved * normal zz

" 配置python路径,让nvim能正常工作
let g:python3_host_prog = 'C:\Program Files\Python36\python.exe'
let g:ycm_use_clangd = 0

" 设置编码
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif

" 自动保存折叠信息,这句*号前面加了?号,直接启动vim的时候就不会报错了,但是保存的时候还是会出错冲突
" au BufWinLeave ?* silent mkview
" au BufWinEnter ?* silent loadview

" 设置折叠类型, 这个foldlevel特别重要,可以让我们快速折叠
:set foldlevel=99
" :set fdm=marker
:set fdm=indent
" :set fdm=expr
" :set fdm=syntax

" 按mm打开、关闭折叠
nnoremap mm @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>ma

" 快速复制替换粘贴
nmap mp diw"0P
nmap mP diw"0p

" 在插入模式移动光标
imap <C-a> <Left>
imap <C-d> <Right>
imap <C-w> <Up>
imap <C-s> <Down>

" 控制窗口大小
nmap <C-;> :resize +3<CR>
nmap <C-'> :resize -3<CR>
nmap <C-.> :vertical resize -3<CR>
nmap <C-,> :vertical resize +3<CR>

" 保存文件
nmap <C-s> :mkview<CR>:w<CR>
nmap <C-e> :loadview<CR>

" 使用alt + jk 上下移动代码块
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" 全选复制到系统剪贴板
nmap <C-a> maggvG$\y`a

" 把复制的东西对齐张贴到下面一行
nmap <C-l> o<TAB><ESC>p<

" 复制当前行到系统剪贴板
nmap <C-c> ^v$\y<ESC>

" 粘贴系统剪贴板
nmap <C-v> "+p

" 关闭
nmap q :q<CR>

" 分屏
nmap sp :sp<CR>
nmap sv :vs<CR>

" 打开终端
nnoremap <Space>r :terminal<CR>a

" 在符号两边加入空格
nnoremap m<Space> i<Space><ESC>la<Space><ESC>h

" 禁用neomake代码检查
" let g:neomake_python_enabled_makers = []

" 设置括号自动补全和跳出
inoremap ' ''<ESC>i
" inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
" inoremap { {<CR>}<ESC>O
inoremap { {}<ESC>i

" 只启动flake8, 不启动pylint了
let g:neomake_python_enabled_makers = ['flake8']
" 在flake8忽略的错误
let g:neomake_python_flake8_maker = {'args': ['--ignore=E501,E231,E302,E305,E225,E126,E203,E123,E251,E124,E306,E122,E221,E128,E702,E222,E121,E201,E502,E226']}

" 下面是pylint的配置,由于不启动pylint了,所以注释掉了
" let g:neomake_python_pylint_maker = {
"   \ 'args': [
"   \ '-d', 'C0103, C0111, line-too-long, bad-whitespace',
"   \ '-f', 'text',
"   \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] " {msg}"',
"   \ '-r', 'n'
"   \ ],
"   \ 'errorformat':
"   \ '%A%f:%l:%c:%t: %m,' .
"   \ '%A%f:%l: %m,' .
"   \ '%A%f:(%l): %m,' .
"   \ '%-Z%p^%.%#,' .
"   \ '%-G%.%#',
"   \ }