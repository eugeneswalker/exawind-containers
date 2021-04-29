#!/bin/bash -e

if [ ! -d nalu-wind ] ; then
 git clone https://github.com/exawind/nalu-wind
 (cd nalu-wind && git submodule update --init --recursive)
fi

nalu_source_root="$(pwd)/nalu-wind"
testroot=${nalu_source_root}/reg_tests/test_files
wd=$(pwd)
testfile=${wd}/test-results.txt

cd ${testroot}/nonIsoEdgeOpenJet
mpirun -np 4 naluX -i nonIsoEdgeOpenJet.yaml >/dev/null 2>&1
../../pass_fail.py nonIsoEdgeOpenJet nonIsoEdgeOpenJet.norm.gold
