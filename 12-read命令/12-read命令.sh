# 1. 用法 #
# 有时，脚本需要在执行过程中，由用户提供一部分数据，这时可以使用read命令。它将用户的输入存入一个变量，方便后面的代码使用。用户按下回车键，就表示输入结束。

# read命令的格式如下。
read [-options] [variable...]

# 上面语法中，options是参数选项，variable是用来保存输入数值的一个或多个变量名。如果没有提供变量名，环境变量REPLY会包含用户输入的一整行数据。

# 下面是一个例子demo.sh。

#!/bin/bash

echo -n "输入一些文本 > "
read text
echo "你的输入：$text"

# 上面例子中，先显示一行提示文本，然后会等待用户输入文本。用户输入的文本，存入变量text，在下一行显示出来。

# read可以接受用户输入的多个值。
echo Please, enter your firstname and lastname
read FN LN
echo "Hi! $LN, $FN !"

# 其余略，见原文