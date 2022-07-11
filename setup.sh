#!/bin/bash

#mkdir bin
mkdir bin/logs
#mv scripts runner.sh -t bin/

cd src
make -j4
cd ../bin
cp ../src/ITGSend/ITGSend ./
cp ../src/ITGDec/ITGDec ./
cp ../src/ITGLog/ITGLog ./
cp ../src/ITGRecv/ITGRecv ./
cp ../src/ITGManager/ITGManager ./

