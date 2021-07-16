#!/bin/bash -ex

sudo $(which singularity) build amr-wind.sif amr-wind.def
