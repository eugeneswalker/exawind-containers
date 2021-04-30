## Working with the Docker image (ecpe4s/exawind:latest)
1. Build the Docker image
```
$> ./build-docker-image.sh
```

2. Launch a container from the image
```
$> docker run -it --rm ecpe4s/exawind

root@8df184bdac63:/# which naluX
/opt/spack/opt/spack/linux-ubuntu20.04-x86_64/gcc-9.3.0/nalu-wind-master-zjlelnq6lbetgsvmpabyqe5krlwl43vq/bin/naluX

root@8df184bdac63:/# which amr_wind
/opt/spack/opt/spack/linux-ubuntu20.04-x86_64/gcc-9.3.0/amr-wind-main-ehzusqf26dxsz7tbjykhubyegyzvinkh/bin/amr_wind
```

## Working with the Singularity image (exawind.sif)

1. Build the Docker image:
```
$> ./build-docker-image.sh
```

2. Build the Singularity image:
```
$> ./build-singularity-image.sh
```

3. Run the Singularity image:
```
$> ./exawind.sif

Exawind Singularity> which naluX
/opt/spack/opt/spack/linux-ubuntu20.04-x86_64/gcc-9.3.0/nalu-wind-master-zjlelnq6lbetgsvmpabyqe5krlwl43vq/bin/naluX

Exawind Singularity> which amr_wind
/opt/spack/opt/spack/linux-ubuntu20.04-x86_64/gcc-9.3.0/amr-wind-main-ehzusqf26dxsz7tbjykhubyegyzvinkh/bin/amr_wind
```

## Run the ExaWind regression tests

1. Launch a container using either the Docker or Singularity image (see above)

2. Clone this repository in the newly launched container and run the tests (here illustrated with Singularity)
```
Exawind Singularity> git clone https://github.com/eugeneswalker/exawind-containers ~/exawind-containers
Exawind Singularity> cd ~/exawind-containers/demo

Exawind Singularity> ./run-nonIsoEdgeOpenJet.sh
PASS: nonIsoEdgeOpenJet.......................     6.2260s 8.1315e-19 5.7732e-15

Exawind Singularity> ./run-nalu-wind-tests.sh
PASS: ablHill3d_ii............................    10.3820s 8.1955e-16 3.6451e-11
PASS: ablHill3d_ip............................    10.0905s 2.7485e-17 2.3703e-13
...

Exawind Singularity> ./run-amr-wind-tests.sh
finished abl_bndry_output
finished abl_godunov
...
```

