#!/bin/bash
#SBATCH -n 1                         # number of tasks
#SBATCH -c 1                        # number of CPU cores
#SBATCH -t 1:00:00                   # walltime (1 hour)
#SBATCH --mem=10G                    # total memory
#SBATCH -p l40-gpu             # GPU partition
#SBATCH --qos=gpu_access             # QoS for GPU use
#SBATCH --gres=gpu:1    # request one GPU
#SBATCH -J compute_bench_job         # job name
#SBATCH -o compute_bench_%j.out      # standard output file
#SBATCH -e compute_bench_%j.err      # standard error file

# --- Environment setup ---
module purge
module load apptainer                
module load cuda/12.6                # load CUDA if needed for GPU

# --- Diagnostics ---
echo "Running on host: $(hostname)"
echo "CUDA devices available:"
nvidia-smi
echo "----------------------------------"

# --- Run your containerized script ---
# Example: assuming your image is compute_bench.sif
apptainer exec --nv stor674.sif \
    python /app/compute_bench.py

# --- Done ---
echo "Job completed at: $(date)"
