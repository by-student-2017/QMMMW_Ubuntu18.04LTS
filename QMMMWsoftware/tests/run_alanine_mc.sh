#!/bin/bash

#echo "++++++++++environment setting ++++++++++"
cd ..
QMMMWsoftware_PATH=`pwd`
export QMMMW_DIR=$QMMMWsoftware_PATH/qmmmw-1.0
export ESPRESSO_DIR=$QMMMWsoftware_PATH/espresso-5.0.2
export LAMMPS_DIR=$QMMMWsoftware_PATH/lammps-30Oct14
source $QMMMW_DIR/bin/ms2.env

#echo "++++++++++run 32water (Mechanical coupling)++++++++++"
cd $HOME/QMMMWsoftware/qmmmw-1.0/examples/alanine_mc
chmod +x job.sh
./job.sh

#echo "++++++++++get xyz++++++++++"
cd $HOME/QMMMWsoftware/qmmmw-1.0/examples/alanine_mc/master
python $QMMMW_DIR/tools/xyz_tool.py dump.xyz -s -d data.alanine -o out.xyz

#echo "++++++++++plot++++++++++"
jmol out.xyz
#vmd out.xyz
#avogadro out.xyz

#echo "++++++++++gnuplot++++++++++"
#cd $HOME/QMMMWsoftware/qmmmw-1.0/examples/32water_mc/qe
#gnuplot
#plot"ms2.rdf.dat" w l
#plot "ms2.msd.dat" w l