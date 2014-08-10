PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
make -f Makefile2 clean
make -f Makefile2
make -f Makefile1 clean
make -f Makefile1 qemu
