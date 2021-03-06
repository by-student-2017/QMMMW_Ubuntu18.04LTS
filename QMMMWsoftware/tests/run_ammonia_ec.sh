#!/bin/bash

#echo "++++++++++environment setting ++++++++++"
cd ..
QMMMWsoftware_PATH=`pwd`
export QMMMW_DIR=$QMMMWsoftware_PATH/qmmmw-1.0
export ESPRESSO_DIR=$QMMMWsoftware_PATH/espresso-5.0.2
export LAMMPS_DIR=$QMMMWsoftware_PATH/lammps-30Oct14
source $QMMMW_DIR/bin/ms2.env

#echo "++++++++++run ammonia (Electrostatic coupling)++++++++++"
cd $HOME/QMMMWsoftware/qmmmw-1.0/examples/ammonia_ec
chmod +x job.sh
./job.sh

#echo "++++++++++get xyz++++++++++"
cd $HOME/QMMMWsoftware/qmmmw-1.0/examples/ammonia_ec/master
python $QMMMW_DIR/tools/xyz_tool.py dump.xyz -s -d data.nh3 -o out.xyz

#echo "++++++++++plot++++++++++"
jmol out.xyz
#vmd out.xyz
#avogadro out.xyz

#echo "++++++++++gnuplot++++++++++"
#cd $HOME/QMMMWsoftware/qmmmw-1.0/examples/ammonia_ec/qe
#gnuplot
#plot"ms2.rdf.dat" w l
#plot "ms2.msd.dat" w l