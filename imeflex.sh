#!/bin/sh

mkdir flex_bison
cd flex_bison

wget https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
gunzip flex-2.6.4.tar.gz
tar -xf flex-2.6.4.tar

cd flex-2.6.4
./configure --prefix=$(pwd) && make && make install

cd ..
wget https://mirrors.dotsrc.org/gnu/bison/bison-3.8.2.tar.gz
gunzip bison-3.8.2.tar.gz
tar -xf bison-3.8.2.tar

cd bison-3.8.2
./configure --prefix=$HOME && make install

echo "export PATH=\"\$PATH:$HOME/bin:$(realpath ../flex-2.6.4/bin)\"" >> ~/.bashrc
cd ..

rm -r flex-2.6.4.* bison-3.8.2.*

cd ..
