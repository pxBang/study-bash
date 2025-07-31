# 1. 字符串的长度 #
# 获取字符串长度的语法如下。
${#varname}

myPath=/home/cam/book/long.file.name
echo ${#myPath}

# 2. 子字符串 #
# 字符串提取子串的语法如下。
${varname:offset:length}
# 上面语法的含义是返回变量$varname的子字符串，从位置offset开始（从0开始计算），长度为length。

count=frogfootman
echo ${count:4:4}
# 上面例子返回字符串frogfootman从4号位置开始的长度为4的子字符串foot。
# 这种语法不能直接操作字符串，只能通过变量来读取字符串，并且不会改变原始字符串。
echo ${"hello":2:3}

# 如果省略length，则从位置offset开始，一直返回到字符串的结尾。
count=frogfootman
echo ${count:4}

# 3. 搜索和替换 #
# Bash 提供字符串搜索和替换的多种方法。
# （1）字符串头部的模式匹配。
# （2）字符串尾部的模式匹配。
# （3）任意位置的模式匹配。



