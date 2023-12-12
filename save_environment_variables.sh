env_line=$(conda env list | grep /envs/shapy)
env_string=($env_line)
PREFIX=${env_string[1]}

echo "Saving environment variables at ${PREFIX}"

mkdir -p ${PREFIX}/etc/conda/activate.d
mkdir -p ${PREFIX}/etc/conda/deactivate.d
touch ${PREFIX}/etc/conda/activate.d/env_vars.sh
touch ${PREFIX}/etc/conda/deactivate.d/env_vars.sh

echo "export PYTHONPATH_ORIGIN=${PYTHONPATH}" >> ${PREFIX}/etc/conda/activate.d/env_vars.sh
echo "export PYTHONPATH=${PYTHONPATH}:$(pwd)/attributes/:$(pwd)/mesh-mesh-intersection/" >> ${PREFIX}/etc/conda/activate.d/env_vars.sh
echo "export CUDA_SAMPLES_INC=$(pwd)/mesh-mesh-intersection/include" >> ${PREFIX}/etc/conda/activate.d/env_vars.sh

echo "export PYTHONPATH=${PYTHONPATH_ORIGIN}" >> ${PREFIX}/etc/conda/deactivate.d/env_vars.sh
echo "unset CUDA_SAMPLES_INC" >> ${PREFIX}/etc/conda/deactivate.d/env_vars.sh