cp -r * ..
cd ..
docker build -t minishell_fuzz:latest .
docker run -ti --mount type=tmpfs,destination=/ramdisk -e AFL_TMPDIR=/ramdisk minishell_fuzz:latest
