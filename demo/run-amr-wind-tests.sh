#!/bin/bash -e

if [ ! -d amr-wind ] ; then
 git clone https://github.com/exawind/amr-wind
 (cd amr-wind && git submodule update --init --recursive)
fi

source_root="$(pwd)/amr-wind"
testroot=${source_root}/test/test_files
wd=$(pwd)
testfile=${wd}/test-results.txt

for t in $(cat test-list-amr-wind.txt) ; do
  np=4
  (
    FOUND=0
    cd ${testroot}/${t} && FOUND=1
    if [[ $FOUND -eq 1 ]] ; then
      mpiexec -n ${np} amr_wind ${t}.i \
       time.max_step=10 \
       amr.plot_file=plt \
       time.plot_interval=10 \
       amrex.throw_exception=1 \
       amrex.signal_handling=0 >/dev/null 2>&1 && echo finished ${t} || echo failed ${t}
    fi
  )
done

sort -o ${testfile} ${testfile}
