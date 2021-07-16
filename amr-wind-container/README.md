## Working with the Docker image (ecpe4s/exawind:latest)
1. Build the Docker image
```
$> ./build-docker-image.sh
```

2. Launch a container from the image
```
$> docker run -it --rm ecpe4s/amr-wind-ppc64le

root@8df184bdac63:/# which amr_wind
/spack/opt/spack/linux-ubuntu20.04-ppc64le/gcc-7.5.0/amr-wind-main-qbduci23idv2dtzjzrexrjd7b3mv6uuy/bin/amr_wind
```

## Working with the Singularity image (exawind.sif)

1. Build the Docker image:
```
$> ./build-docker-image.sh
```

2. Save the Docker image as a docker-archive
```
$> docker save -o amr-wind.tar ecpe4s/amr-wind-ppc64le:latest
```

3. Build the Singularity image:
```
$> ./build-singularity-image.sh
```

4. Run the Singularity image:
```
$> ./amr-wind.sif

Amr-Wind Singularity> which amr_wind
/spack/opt/spack/linux-ubuntu20.04-ppc64le/gcc-7.5.0/amr-wind-main-qbduci23idv2dtzjzrexrjd7b3mv6uuy/bin/amr_wind
```
