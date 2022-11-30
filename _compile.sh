#!/bin/sh

sed -i 's/\-Werror//g' $(find .)
sed -i 's/\clang/afl-clang-lto -fsanitize=address,undefined/g' $(find .)
sed -i 's/\cc/afl-clang-lto -fsanitize=address,undefined/g' $(find .)
sed -i 's/\gcc/afl-clang-lto -fsanitize=address,undefined/g' $(find .)
export AFL_USE_ASAN=1
export AFL_USE_UBSAN=1
export AFL_USE_LSAN=1
make fclean
make -j
