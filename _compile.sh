#!/bin/sh

FILES=$(find . -type f)

set -x \
	&& sed -i 's/\-Werror//g' $FILES \
	&& sed -i 's/\clang/afl-clang-lto -fsanitize=address,undefined/g' $FILES \
	&& sed -i 's/\cc/afl-clang-lto -fsanitize=address,undefined/g' $FILES \
	&& sed -i 's/\gcc/afl-clang-lto -fsanitize=address,undefined/g' $FILES
export AFL_USE_ASAN=1
export AFL_USE_UBSAN=1
export AFL_USE_LSAN=1
make fclean
make -j
