call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'               " 文件树
Plug 'Valloric/YouCompleteMe'			 " 代码提示补全插件
Plug 'octol/vim-cpp-enhanced-highlight'  " C++代码高亮
Plug 'sickill/vim-monokai'               " monokai主题
Plug 'vim-airline/vim-airline'           " 美化状态栏
Plug 'vim-airline/vim-airline-themes'    " 设置ailine
Plug 'plasticboy/vim-markdown'           " markdown高亮
Plug 'mhinz/vim-signify'				 " 在 Vim 中显示版本控制系统状态
Plug 'dense-analysis/ale'				 " 异步语法检查插件
Plug 'morhetz/gruvbox'					 " 主题	
"Plug 'neoclide/coc.nvim', {'branch': 'release'} "代码自动补全
Plug 'jiangmiao/auto-pairs'				 " 自动补上/删除右括号	
Plug 'valloric/vim-indent-guides'		 " 显示缩进线
Plug 'Me1onRind/EscSync'				 " 同步配置文件到gist

call plug#end()

" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn 

" 快捷键设置

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

"向下翻半屏
nmap <Leader>u <C-U>
" 向上翻半屏
nmap <Leader>d <C-D>
" 设置快捷键gs遍历各分割窗口。快捷键速记法：goto the next spilt window
nnoremap <Leader>gg <C-W><C-W>
" 定义快捷键 关闭当前分割窗口
nmap <Leader>q :q<CR>
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G

" ack搜索时不打开第一个搜索文件
"map <Leader>fw :Ack! <Space>
" AckFile不打开第一个搜索文件
"map <Leader>ff :AckFile!<Space>
" 定义快捷键
"nmap <Leader>w :w<CR>
" 删除光标所在单词
"nmap e daw
" close TAB
"nmap tabc :tabc <CR>
" go to previous table
"map gp :tabp <CR>
" 定义快捷键 跳转到光标所在关键词的定义处
" here are multiple matches, show me a list of all the matching tags 
"nmap <Leader>gt g<C-]>
" 定义快捷键 跳回原关键词 与 ;gr 配合使用
"nmap <Leader>gr <C-T>
" 快速移动到行首，行尾
"map <Leader>1 ^
"map <Leader>2 $
" 补全提示
""nmap <Leader>p <C-P>
" 快速切换C H源文件
"nmap <Leader>a :A<CR>

"快速切换到上一个文件
" nmap <Leader>j :bn<CR>
" nmap <Leader>k :bp<CR>

" 向左
"nnoremap <leader>h <C-W><C-H>
" 向右
"nnoremap <leader>l <C-W><C-L>
" 向上
"nnoremap <Leader>k <C-W><C-K>
" 向下
"nnoremap <Leader>j <C-W><C-J>
" 打开文件
"nmap <Leader>e :e<Space>
" 不关闭文件推出
"nmap <Leader>z <C-Z>
" 水平分隔
"nmap <Leader>s :Sex<CR>
" 竖直分隔
"nmap <Leader>v :Vex<CR>
" 全局替换
"nmap <Leader>r :%s/fileName-/fileName+/g

"make 运行 
:set makeprg=g++\ -Wall\ \ %

" C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc


" C,C++的调试

map <F8> :call Rungdb()<CR>

func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

" 让vimrc配置变更立即生效'
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 设置主题
colorscheme gruvbox

" 设置背景为黑
set background=dark 

filetype on
set signcolumn=yes "强制显示侧边栏，防止时有时无

" 语法高亮
syntax on
filetype plugin indent on "启用文件类型检测、插件支持和缩进设置

"搜索关键词高亮
set hlsearch
" 设置缩进格式
set shiftwidth=4 "自动缩进空白字符个数
set tabstop=4 "一个 tab 显示出来是多少个空格的长度
set autoindent "自动缩进
set cindent    "自动缩进补充

" 设置 YouCompleteMe 插件中使用的 Clangd 二进制文件的路径
let g:ycm_clangd_binary_path='clangd'
" 显示行号
set number
" 设置非兼容模式
set nocompatible

" 重新打开文档时光标回到文档关闭前的位置
if has("autocmd")
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
\ endif
endif

" 鼠标定位
" 鼠标定位和鼠标拷贝似乎不能共存，按住shift再使用鼠标拷贝
set selectmode=mouse,key "可以使用鼠标或键盘进行文本选择
set selection=exclusive "只有当你在Visual模式下选择文本时，其他文本才能被复制到系统剪贴板
set mouse=n "表示禁用鼠标,只在可视模式下使用鼠标，set mouse=a这个命令导致在vim下复制粘贴不好

let g:indent_guides_enable_on_vim_startup = 1 "添加行，vim启动时启用
let g:indent_guides_start_level = 1           "添加行，开始显示对齐线的缩进级别
let g:indent_guides_guide_size = 1            "添加行，对齐线的宽度，（1字符）
let g:indent_guides_tab_guides = 0            "添加行，对tab对齐的禁用

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set novisualbell    " 不要闪烁(不明白)

" 不产生.swp文件
set noswapfile

"共享剪贴板  
set clipboard+=unnamed 

" Set cursor shape and color
" INSERT mode
let &t_SI = "\<Esc>[1 q" . "\<Esc>]12;rgb:D9/D6/18\x7"
"REPLACE mode
let &t_SR = "\<Esc>[2 q" . "\<Esc>]12;blue\x7"
" NORMAL mode
let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;green\x7"
" 1 -> blinking block  闪烁的方块
" 2 -> solid block  不闪烁的方块
" 3 -> blinking underscore  闪烁的下划线
" 4 -> solid underscore  不闪烁的下划线
" 5 -> blinking vertical bar  闪烁的竖线
" 6 -> solid vertical bar  不闪烁的竖线


" 去掉输入错误的提示声音
set noeb
set vb t_vb=

" 文件树的设置
nmap <Leader><Leader> :NERDTreeToggle<CR>
let NERDTreeWinSize=32
" 设置NERDTree子窗口宽度
let NERDTreeWinPos="left"      " 设置NERDTree子窗口位置
let NERDTreeShowHidden=1        " 显示隐藏文件
let NERDTreeMinimalUI=1         " NERDTree 子窗口中不显示冗余帮助信息
" 设置忽略的文件
let NERDTreeIgnore=['.vim$','\~$', '~.o$','~.d$', '\.a$', '.out$', '\.tgz$']
" 绑定F2到NERDTreeToggle
map <F2> :NERDTreeToggle<CR>


" YouCompleteMe
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处
"let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"



"" airline
let laststatus = 2
let g:airline_powerline_fonts = 1
let g:airline_theme = "dark"
let g:airline#extensions#tabline#enabled = 1



"" vim-monokai
"colorscheme monokai

"" vim-markdown
" Github风格markdown语法
let g:vim_markdown_no_extensions_in_markdown = 1

"" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

" 自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
" 显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' 
"设置状态栏显示的内容,这里必须添加%{ALEGetStatusLine()到状态栏里
"设置ale显示内容
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" 对verilog、c++、c、python单独设置linter
let g:ale_linters = { 'verilog': ['vlog'],
\   'c++': ['clangd'],
\   'c': ['gcc'],
\   'python': ['pylint'],
\}


let g:ale_lint_on_text_changed = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"配置同步插件  :PushConfig 推送  :PullConfig 拉取 在.bashrc文件中使用命令备份.bashrc文件 
"项目地址：https://github.com/Me1onRind/EscSync
let g:esc_sync_github_token = "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"
let g:esc_sync_gist_id = "433e733c692e3f6dd79ae68419a2e3dd"
"g:esc_sync_backup 当远程文件和本地文件不同时，在覆盖之前是否将本地文件备份到/tmp目录，默认开启，设置为0关闭。
" let g:esc_sync_backup = 0
let g:esc_sync_files = {
    \ "~/.vimrc": {"remote_filename": ".vimrc"},
    \ "~/.bashrc": {"remote_filename": ".bashrc"},
    \ "/private/tmp/": {"remote_prefix": "tmp"},
\ }

"新建.c,.h,.sh,.java文件，自动插入文件头 

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 

""定义函数SetTitle，自动插入文件头 

func SetTitle() 

    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: Jake Yang") 
        call append(line(".")+2, "\# mail: 1204871655@qq.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "")
    "else 
        "call setline(1, "/*************************************************************************") 
        "call append(line("."), "> File Name: ".expand("%")) 
 	    "call append(line(".")+1, "> Author: Jake Yang") 
        "call append(line(".")+2, "> Mail: 1204871655@qq.com ") 
        "call append(line(".")+3, "> Created Time: ".strftime("%c")) 
        "call append(line(".")+4, "************************************************************************/") 
        "call append(line(".")+5, "")
    endif

    if &filetype == 'ccpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
		call append(line(".")+9, "int main(int argc, char* argv[])")
		call append(line(".")+10, "{")
		call append(line(".")+11, "    ")
		call append(line(".")+12, "    return 0;")
		call append(line(".")+13, "}")
    endif

    if &filetype == 'cc'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
        call append(line(".")+8, "int main(int argc, char* argv[])")
		call append(line(".")+9, "{")
		call append(line(".")+10, "    ")
		call append(line(".")+11, "    return 0;")
		call append(line(".")+12, "}")
    endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

" mf使用C语言模板
map mf i#include <stdio.h><Enter><Enter>int main(int argc, char* argv[])<Enter>{<Enter>return 0;<Esc>O<Esc>O
" mfc使用CPP模板
map mfc i#include<iostream><ESC>ousing namespace std;<Enter><Enter>int main(int argc, char* argv[])<Enter>{<Enter>return 0;<Esc>O<Esc>O

