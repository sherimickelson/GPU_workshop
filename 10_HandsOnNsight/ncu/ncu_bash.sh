### Job Name
#PBS -N GPU_workshop10
### Charging account
### Insert your own project code here when working on self-paced content
##PBS -A UCIS0004
### Specifiy queue, use gpudev queue for faster access to GPUs for debug scale work from 8am to 6:30pm MT. Otherwise, Casper routing queue is fine
##PBS -q gpudev
##PBS -q casper
### Request appropriate number of resources
#PBS -l select=1:ncpus=1:ngpus=1
### Set the GPU type to run on
##PBS -l gpu_type=v100
### Specify walltime limit, ie one minute
#PBS -l walltime=01:00
### Join standard output and error streams into single file
#PBS -j oe
### Specifiy output file name
#PBS -o ncu_MW.out

ml nvhpc/22.5 openmpi &> /dev/null

ncu --set full --launch-skip 29 --launch-count 5 -f -o $NCU_REPORT \
--print-summary per-kernel --target-processes all --import-source on \
mpiexec -n 1 ./openacc