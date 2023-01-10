#!/bin/sh

bash _compile.sh
afl-fuzz -i input -o output -x minishell.dict -- ./minishell
