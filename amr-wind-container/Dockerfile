FROM ecpe4s/ubuntu20.04-runner-ppc64le:2021-07-01

COPY spack.yaml /

RUN git clone https://github.com/spack/spack /spack \
 && (cd /spack && git checkout e96ba16555dd6bb3595829773f91a00b0155b9bf) \
 && rm -rf /spack/.git

RUN . /spack/share/spack/setup-env.sh \
 && spack mirror add E4S https://cache2.e4s.io/exawind-summit \
 && spack buildcache keys -it \
 && spack install --cache-only gcc@10.3.0 target=ppc64le \
 && spack compiler find $(spack location -i gcc@10.3.0) \
 && spack install --cache-only gcc@7.5.0 target=ppc64le \
 && spack compiler find $(spack location -i gcc@7.5.0) \
 && spack -e . concretize -f | tee dag \
 && spack -e . install --cache-only \
 && spack clean -a \
 && rm -rf /tmp/root

RUN . /spack/share/spack/setup-env.sh \
 && echo . /spack/share/spack/setup-env.sh >> /etc/bash.bashrc \
 && export _GCC=$(spack location -i gcc@7.5.0) \
 && echo "spack compiler add ${_GCC} >/dev/null 2>&1" >> /etc/bash.bashrc \
 && echo spack load amr-wind >> /etc/bash.bashrc
