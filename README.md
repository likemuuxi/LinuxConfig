## 插件安装
### 安装vim-plug 插件管理工具
远程安装
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
### 修改配置文件
[配置文件](https://gist.github.com/likemuuxi/433e733c692e3f6dd79ae68419a2e3dd)
### 安装卸载插件
- 重新打开 vim 并使用命令 `:PlugInstall`
- 删除插件，只需要将写在 .vimrc 配置文件内的插件删除，重启 vim 并执行命令 `:PlugClean` 
### 插件配置
#### YouCompleteMe
编译YouCompleteMe（YCM）的核心库。YCM是一个强大的自动补全引擎，用于Vim和其他编辑器。

1. 首先，确保你已经安装了构建工具和Python头文件。在Ubuntu中，你可以使用以下命令来安装它们：
		`sudo apt install build-essential python3-dev`

2. 然后，进入YouCompleteMe的安装目录。通常，它位于你的Vim配置目录中
		`cd ~/.vim/plugged/YouCompleteMe`
		如果你使用的是其他插件管理器或安装位置，你可能需要修改这个路径。

3. 首先，你需要在你的系统上安装cmake。如果你使用的是Ubuntu或其他基于Debian的系统，你可以使用以下命令来安装：
		`sudo apt-get install cmake`

4. 在YCM目录中，运行`install.py`脚本编译YCM。如果你需要支持C-family languages（C、C++、Objective-C、Objective-C++），你需要安装libclang。可以通过给 `install.py` 脚本添加 `--clang-completer` 选项来安装：
		`python3 install.py`
		`python3 install.py --clang-completer`
		这将编译YCM的核心库。

完成这些步骤后，需要重新启动Vim。此时，YCM应该能够正常工作了。

> [!tip]
> **问题：**
> c++: fatal error: 已杀死 signal terminated program cc1plus
> compilation terminated.
> **解决方法：**
> 增加交换空间：如果内存不足，增加交换空间可以帮助解决这个问题。你可以创建一个交换文件并启用它来增加交换空间。以下是创建和启用一个4GB交换文件的命令：
> `sudo fallocate -l 4G /swapfile`
> `sudo chmod 600 /swapfile`
> ` sudo mkswap /swapfile  `
> `sudo swapon /swapfile`

### 插件使用
#### NERDTree
```md
ctrl + w + h    光标 focus 左侧树形目录
ctrl + w + l    光标 focus 右侧文件显示窗口
ctrl + w + w    光标自动在左右侧窗口切换
ctrl + w + r    移动当前窗口的布局位置
o       在已有窗口中打开文件、目录或书签，并跳到该窗口
go      在已有窗口 中打开文件、目录或书签，但不跳到该窗口
t       在新 Tab 中打开选中文件/书签，并跳到新 Tab
T       在新 Tab 中打开选中文件/书签，但不跳到新 Tab
i       split 一个新窗口打开选中文件，并跳到该窗口
gi      split 一个新窗口打开选中文件，但不跳到该窗口
s       vsplit 一个新窗口打开选中文件，并跳到该窗口
gs      vsplit 一个新 窗口打开选中文件，但不跳到该窗口
!       执行当前文件
O       递归打开选中 结点下的所有目录
x       合拢选中结点的父目录
X       递归 合拢选中结点下的所有目录
e       Edit the current dif
双击    相当于 NERDTree-o
中键    对文件相当于 NERDTree-i，对目录相当于 NERDTree-e
D       删除当前书签
P       跳到根结点
p       跳到父结点
K       跳到当前目录下同级的第一个结点
J       跳到当前目录下同级的最后一个结点
k       跳到当前目录下同级的前一个结点
j       跳到当前目录下同级的后一个结点
C       将选中目录或选中文件的父目录设为根结点
u       将当前根结点的父目录设为根目录，并变成合拢原根结点
U       将当前根结点的父目录设为根目录，但保持展开原根结点
r       递归刷新选中目录
R       递归刷新根结点
m       显示文件系统菜单
cd      将 CWD 设为选中目录
I       切换是否显示隐藏文件
f       切换是否使用文件过滤器
F       切换是否显示文件
B       切换是否显示书签
q       关闭 NerdTree 窗口
?       切换是否显示 Quick Help


:tabnew [++opt选项] ［＋cmd］ 文件      建立对指定文件新的tab
:tabc   关闭当前的 tab
:tabo   关闭所有其他的 tab
:tabs   查看所有打开的 tab
:tabp   前一个 tab
:tabn   后一个 tab
```


## 参考
- [PowerVim](https://github.com/youngyangyang04/PowerVim)
- [vim搭建c++环境_vim c++](https://blog.csdn.net/qq_62357480/article/details/126854282?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-1-126854282-blog-133426883.235%5Ev39%5Epc_relevant_3m_sort_dl_base4&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-1-126854282-blog-133426883.235%5Ev39%5Epc_relevant_3m_sort_dl_base4&utm_relevant_index=2)
- [7款优秀Vim插件帮你打造完美IDE](https://zhuanlan.zhihu.com/p/145793963)
- [Vim使用全指南 (环境配置，插件推荐，美化) (C++,Python,MarkDown,R...)](https://blog.csdn.net/Liukairui/article/details/107392243)
- [VIM 自动配置（代码补全，代码高亮，符号补全等等） - 广汽白云山 - 博客园 (cnblogs.com)](https://www.cnblogs.com/write-hua/p/7697762.html)

- [ ls 文件夹和文件没有颜色的解决办法](https://www.cnblogs.com/kaerxifa/p/12161658.html)
- [Vim 配置光标形状和颜色](https://www.jianshu.com/p/65c29ea0a0aa)

- [一个用于在代码中可视化显示缩进级别的vim插件](https://github.com/preservim/vim-indent-guides)
- [在VIM中显示缩进对齐线_vim缩进对齐线](https://blog.csdn.net/panderang/article/details/78147968)

