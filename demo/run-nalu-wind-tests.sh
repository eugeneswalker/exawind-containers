#!/bin/bash -e

if [ ! -d nalu-wind ] ; then
 git clone https://github.com/exawind/nalu-wind
 (cd nalu-wind && git submodule update --init --recursive)
fi

#nalu_source_root=${NALU_SOURCE_ROOT:-$(pwd)/nalu-wind}
nalu_source_root="$(pwd)/nalu-wind"
testroot=${nalu_source_root}/reg_tests/test_files
wd=$(pwd)
testfile=${wd}/test-results.txt

for t in $(cat test-list-nalu-wind.txt) ; do
  n=$(echo $t | cut -d: -f1)
  np=$(echo $t | cut -d: -f2)
  (
    FOUND=0
    cd ${testroot}/${n} && FOUND=1
    if [[ $FOUND -eq 1 ]] ; then  
      mpirun -np ${np} naluX -i ${n}.yaml >/dev/null 2>&1
      ../../pass_fail.py ${n} ${n}.norm.gold | tee -a ${testfile} || :
    fi
  )
done

sort -o ${testfile} ${testfile}
