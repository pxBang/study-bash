# 1. 常见错误 #

# 编写 Shell 脚本的时候，一定要考虑到命令失败的情况，否则很容易出错。
#! /bin/bash

dir_name=/path/not/exist

cd $dir_name
rm *
# 上面脚本中，如果目录$dir_name不存在，cd $dir_name命令就会执行失败。这时，就不会改变当前目录，脚本会继续执行下去，导致rm *命令删光当前目录的文件。

# 如果改成下面的样子，也会有问题。
cd $dir_name && rm *
# 上面脚本中，只有cd $dir_name执行成功，才会执行rm *。但是，如果变量$dir_name为空，cd就会进入用户主目录，从而删光用户主目录的文件。

# 下面的写法才是正确的。
[[ -d $dir_name ]] && cd $dir_name && rm *

# 上面代码中，先判断目录$dir_name是否存在，然后才执行其他操作。

# 如果不放心删除什么文件，可以先打印出来看一下。
[[ -d $dir_name ]] && cd $dir_name && echo rm *

# 上面命令中，echo rm *不会删除文件，只会打印出来要删除的文件。

