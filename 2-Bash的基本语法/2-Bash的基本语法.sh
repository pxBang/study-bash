# 1. ehco命令 #
echo hello world

#输出多行文本，将多行文本放到引号里面
echo "<HTML>
  <HEAD>
        <TITLE>
  </HEAD>
  <BODY>
        Page body
  </BODY>
</HTML>"

## 1.1 -n参数 ##

# 默认情况下，echo输出的文本末尾会有一个回车符。-n参数可以取消末尾的回车符，使得下一个提示符紧跟在输出内容的后面
echo -n hello world
echo -n a;echo b

## 1.2 -e参数 ##

#-e参数会解释引号（双引号和单引号）里面的特殊字符（比如换行符\n）。如果不使用-e参数，即默认情况下，引号会让特殊字符变成字符，echo不解释它们，原样输出
echo "Hello\nWorld"
echo -e "Hello\nWorld"

# 2.命令格式 #
# 有些命令比较长，写成多行有利于阅读和编辑，这时可以在每一行的结尾加上反斜杠
echo foo bar

echo foo \
bar

# 3. 空格 #
# bash使用空格区分不同的参数
# 如果参数之间有多个空格，bash会自动忽略多余的空格
echo this is a   test

# 4.分号 #

#分号（;）是命令的结束符，使得一行可以执行多个命令，上一个命令执行结束后，再执行第二个命令
clear;ls

# 5.命令的组合符&&和|| #

# 除了分号，Bash还提供两个命令组合符&&和||,允许更好的控制多个命令之间的继发关系
# command1 && command2: 该命令的意思是，如果command1运行成功，则继续运行command2命令
# command1 || command2: 该命令的意思是，如果command1运行失败，则继续运行command2命令
cat filelist.txt; ls -l filelist.txt
cat filelist.txt && ls -l filelist.txt
cat filelist.txt || ls -l filelist.txt

# 6.type命令 #
#bash本身内置了很多命令，同时也可以执行外部程序，怎么知道一个命令是内置命令，还是外部程序呢
# type命令用来判断命令的来源
type echo
type ls
type type
# 如果要查看一个命令的所有定义，可以使用type命令的-a参数
type -a echo
# type命令的-t参数，可以返回一个命令的类型：别名(alias)、关键词(keyword)、函数(function)、内置命令(builtin)和文件(file)
