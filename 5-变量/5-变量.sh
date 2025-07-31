# 1. 简介 #
# Bash 变量分成环境变量和自定义变量两类。

## 1.1 环境变量 ##
# 环境变量是 Bash 环境自带的变量，进入 Shell 时已经定义好了，可以直接使用。它们通常是系统定义好的，也可以由用户从父 Shell 传入子 Shell。

## 1.2 自定义变量 ##
# 自定义变量是用户在当前 Shell 里面自己定义的变量，仅在当前 Shell 可用。一旦退出当前 Shell，该变量就不存在了。

# 2.创建变量 #
# 变量声明的语法如下。
variable=value
# 上面命令中，等号左边是变量名，右边是变量。注意，等号两边不能有空格。
# 如果变量的值包含空格，则必须将值放在引号中。
myvar="hello world"

# 3.读取变量 #
# 读取变量的时候，直接在变量名前加上$就可以了。
foo=bar
echo $foo
# 如果变量不存在，Bash 不会报错，而会输出空字符。

a=foo
echo $a_file
echo ${a}_file

# 如果变量值包含连续空格（或制表符和换行符），最好放在双引号里面读取。
a="1 2  3"
echo $a
echo "$a"
# 上面示例中，变量a的值包含两个连续空格。如果直接读取，Shell 会将连续空格合并成一个。只有放在双引号里面读取，才能保持原来的格式。

# 4. 删除变量 #
# unset命令用来删除一个变量。

unset NAME

# 5. 输出变量，export 命令
# 用户创建的变量仅可用于当前 Shell，子 Shell 默认读取不到父 Shell 定义的变量。为了把变量传递给子 Shell，需要使用export命令。这样输出的变量，对于子 Shell 来说就是环境变量。
# export命令用来向子 Shell 输出变量。
NAME=foo
export NAME
#上面命令输出了变量NAME。变量的赋值和输出也可以在一个步骤中完成。
export NAME=value
# 上面命令执行后，当前 Shell 及随后新建的子 Shell，都可以读取变量$NAME。
# 子 Shell 如果修改继承的变量，不会影响父 Shell。

export foo=bar
bash
echo $foo
foo=baz
exit
echo $foo
# 上面例子中，子 Shell 修改了继承的变量$foo，对父 Shell 没有影响。

# 6. 特殊变量 #
# Bash 提供一些特殊变量。这些变量的值由 Shell 提供，用户不能进行赋值。
# $?：$?为上一个命令的退出码，用来判断上一个命令是否执行成功。返回值是0，表示上一个命令执行成功；如果不是零，表示上一个命令执行失败。
ls doesnotexist
echo $?

# $$:$$为当前 Shell 的进程 ID。
echo $$

# $_:$_为上一个命令的最后一个参数。
grep dictionary /usr/share/dict/words
echo $_

# $!:$!为最近一个后台执行的异步命令的进程 ID。
kkk &
echo $!
# 上面例子中，kkk是后台运行的命令，$!返回该命令的进程 ID。

# $0:$0为当前 Shell 的名称（在命令行直接执行时）或者脚本名（在脚本中执行时）。
echo $0

# $-:$-为当前 Shell 的启动参数。

# $@和$#:$#表示脚本的参数数量，$@表示脚本的参数值，参见脚本一章。

# 7. 变量的默认值 #
#Bash 提供四个特殊语法，跟变量的默认值有关，目的是保证变量不为空。
${varname:-word}
# 上面语法的含义是，如果变量varname存在且不为空，则返回它的值，否则返回word。它的目的是返回一个默认值，比如${count:-0}表示变量count不存在时返回0。

${varname:=word}
# 上面语法的含义是，如果变量varname存在且不为空，则返回它的值，否则将它设为word，并且返回word。它的目的是设置变量的默认值，比如${count:=0}表示变量count不存在时返回0，且将count设为0。

${varname:+word}
# 上面语法的含义是，如果变量名存在且不为空，则返回word，否则返回空值。它的目的是测试变量是否存在，比如${count:+1}表示变量count存在时返回1（表示true），否则返回空值。

${varname:?message}
# 上面语法的含义是，如果变量varname存在且不为空，则返回它的值，否则打印出varname: message，并中断脚本的执行。如果省略了message，则输出默认的信息“parameter null or not set.”。它的目的是防止变量未定义，比如${count:?"undefined!"}表示变量count未定义时就中断执行，抛出错误，返回给定的报错信息undefined!。


# 上面四种语法如果用在脚本中，变量名的部分可以用数字1到9，表示脚本的参数。
filename=${1:?"filename missing."}
# 上面代码出现在脚本中，1表示脚本的第一个参数。如果该参数不存在，就退出脚本并报错。



