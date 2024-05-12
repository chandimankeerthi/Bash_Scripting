#!/bin/bash
# created by  Chandiman Keerthi
# dmo_env_container_start : Owned By Implementation Team
#Do not make any chages without Informing to the Responsible Persons

container_tmp_path=/home/ibl_q_dkr/DO_NOT_DELETE/container_tmp/

echo "Initialized container start..."

echo "start the 'test-password-server' container..."
docker start 6ac8fb6c891f

echo "start the other containers..."
while read p; do docker start $p  ; done < $container_tmp_path"latest_container_list.txt";

echo "containers successfully started..."

docker ps;


