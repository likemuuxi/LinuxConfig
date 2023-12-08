# Vim配置
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
> \
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
### 相关教程
- [PowerVim](https://github.com/youngyangyang04/PowerVim)
- [vim搭建c++环境_vim c++](https://blog.csdn.net/qq_62357480/article/details/126854282?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-1-126854282-blog-133426883.235%5Ev39%5Epc_relevant_3m_sort_dl_base4&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-1-126854282-blog-133426883.235%5Ev39%5Epc_relevant_3m_sort_dl_base4&utm_relevant_index=2)
- [7款优秀Vim插件帮你打造完美IDE](https://zhuanlan.zhihu.com/p/145793963)
- [Vim使用全指南 (环境配置，插件推荐，美化) (C++,Python,MarkDown,R...)](https://blog.csdn.net/Liukairui/article/details/107392243)
- [VIM 自动配置（代码补全，代码高亮，符号补全等等） - 广汽白云山 - 博客园 (cnblogs.com)](https://www.cnblogs.com/write-hua/p/7697762.html)
- [Vim 配置光标形状和颜色](https://www.jianshu.com/p/65c29ea0a0aa)
- [在VIM中显示缩进对齐线_vim缩进对齐线](https://blog.csdn.net/panderang/article/details/78147968)
### 插件项目地址
- [YouCompleteMe: A code-completion engine for Vim ](https://github.com/ycm-core/YouCompleteMe)
- [ale 异步检查Vim/Neovim中的语法并修复文件，支持语言服务器协议（LSP）](https://github.com/dense-analysis/ale)
- [auto-pairs: Vim plugin, insert or delete brackets, parens, quotes in pair ](https://github.com/jiangmiao/auto-pairs)
- [gruvbox: Retro groove color scheme for Vim](https://github.com/morhetz/gruvbox)
- [preservim/nerdtree: A tree explorer plugin for vim.](https://github.com/preservim/nerdtree)
- [tokyonight-vim](https://github.com/ghifarit53/tokyonight-vim)
- [vim-airline: lean & mean status/tabline for vim that's light as air ](https://github.com/vim-airline/vim-airline)
- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)
- [vim-indent-guides](https://github.com/preservim/vim-indent-guides)
- [vim-markdown: Markdown Vim Mode](https://github.com/preservim/vim-markdown)
- [vim-monokai](https://github.com/ku1ik/vim-monokai)
- [vim-signify: Show a diff using Vim its sign column.](https://github.com/mhinz/vim-signify)
# Windows终端美化
## 安装scoop和模块
在 PowerShell 中输入下面内容，保证允许本地脚本的执行：
<br>`set-executionpolicy remotesigned -scope currentuser`
<br>然后执行下面的命令安装 Scoop：
<br>`iex (new-object net.webclient).downloadstring('https://get.scoop.sh')`

```bash
# 安装 posh-git 和 oh-my-posh 这两个模块
Install-Module posh-git -Scope CurrentUser 
Install-Module oh-my-posh -Scope CurrentUser

# 如果之前没有配置文件，就新建一个 PowerShell 配置文件
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
用记事本打开配置文件
notepad $PROFILE
```
在配置文件中添加下面的内容
```
Import-Module oh-my-posh 
#设置主题
Set-PoshPrompt Paradox
# 引入posh-git
Import-Module posh-git 
# 设置 Tab 键补全
Set-PSReadlineKeyHandler -Key Tab -Function Complete
# 设置 Ctrl+d 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete 
# 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo 
# 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key UpArrow  -ScriptBlock {
[Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchBackward()
[Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}
# 设置向下键为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key DownArrow -ScriptBlock {
[Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchForward()
[Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}
```
[主题推荐](https://sspai.com/post/52907#:~:text=%E6%9D%A5%E9%85%8D%E7%BD%AE%E5%8D%B3%E5%8F%AF%E3%80%82-,%E4%B8%BB%E9%A2%98%E6%8E%A8%E8%8D%90,-%E4%BD%BF%E7%94%A8%E6%9F%90%E4%B8%AA)
## 更换字体
[字体下载地址](https://www.nerdfonts.com/font-downloads)
<br>**推荐使用：**[FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/DroidSansMono.zip)
<br>字体更换步骤：设置>>默认值>>外观>>选择字体
![image](https://github.com/likemuuxi/vimrc/assets/85612715/ce95f5a5-5c7e-426e-b838-f2c37e8aecd7)
## 参考
- [5 个 PowerShell 主题，让你的 Windows 终端更好看 - 少数派 (sspai.com)](https://sspai.com/post/52907)
- [Windows Terminal 完美配置 PowerShell 7.1 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/137595941)
# Linux终端美化
## 安装zsh
`sudo apt install zsh`
## 设为默认shell
`sudo chsh -s $(which zsh)`
## 安装oh-my-zsh
**curl** 
<br>`sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
<br>**wget**
<br>`sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`
## 插件
1. **zsh-syntax-highlighting:高亮（命令正确时会绿色显示，否则红色显示）**  
<br>`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

2. **zsh-autosuggestions:输入命令行时自动补全**  
<br>`git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions`

## 配置文件
- `ZSH_THEME="agnoster"`
- `plugins=(zsh-syntax-highlighting)`
-`plugins=(zsh-autosuggestions)`
## 重新载入配置文件**
`source ~/.zshrc`
## 参考
- [linux下oh-my-zsh安装及配置-CSDN博客](https://blog.csdn.net/gloriaied/article/details/84645065)
- [ ls 文件夹和文件没有颜色的解决办法](https://www.cnblogs.com/kaerxifa/p/12161658.html)

