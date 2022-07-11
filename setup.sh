#!/bin/bash

mkdir bin
cd src
make -j4
cd ../bin
cp ../src/ITGSend/ITGSend ./
cp ../src/ITGDec/ITGDec ./
cp ../src/ITGLog/ITGLog ./
cp ../src/ITGPlot/ITGPlot ./
cp ../src/ITGRecv/ITGRecv ./
cp ../src/ITGManager/ITGManager ./

cat "-a 10.244.105.38 -N 2.175 0.05 -n 115 35 -j 1 -t 1000 -T TCP" > ../script_file
