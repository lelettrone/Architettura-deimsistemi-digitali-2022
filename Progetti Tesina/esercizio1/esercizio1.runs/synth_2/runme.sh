#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=D:/Vivado/2020.2/ids_lite/ISE/bin/nt64;D:/Vivado/2020.2/ids_lite/ISE/lib/nt64:D:/Vivado/2020.2/bin
else
  PATH=D:/Vivado/2020.2/ids_lite/ISE/bin/nt64;D:/Vivado/2020.2/ids_lite/ISE/lib/nt64:D:/Vivado/2020.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='C:/Users/Vincenzo Pascarella/Desktop/Universit/Magistrale/Architettura_S_D/Vivado/progetti_tesina/esercizio1/esercizio1.runs/synth_2'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log rete_16_4.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source rete_16_4.tcl