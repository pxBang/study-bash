# 1. cd - #
# Bash 可以记忆用户进入过的目录。默认情况下，只记忆前一次所在的目录，cd -命令可以返回前一次的目录。
cd bar

cd -

# 2. pushd，popd #
# 如果希望记忆多重目录，可以使用pushd命令和popd命令。它们用来操作目录堆栈。pushd命令的用法类似cd命令，可以进入指定的目录。
pushd ~/foo
pushd /etc
popd
popd
popd

# 3. dirs 命令 #

# dirs命令可以显示目录堆栈的内容，一般用来查看pushd和popd操作后的结果。

dirs