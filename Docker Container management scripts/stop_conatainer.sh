#!/bin/bash
# created by  Chandiman Keerthi
# dmo_env_container_stop : Owned By Implementation Team
#Do not make any chages without Informing to the Responsible Persons

container_tmp_path=/home/ibl_q_dkr/DO_NOT_DELETE/container_tmp/
container_history_path=/home/ibl_q_dkr/DO_NOT_DELETE/container_history/stop_container/

echo "Initialized container stop..."

echo "deleting previous containers detail list..."
rm $container_tmp_path"latest_container_list.txt";

echo "taking running container IDs..."
docker ps -q | grep -v "6ac8fb6c891f" > $container_tmp_path"latest_container_list.txt";

echo "storing running container IDs..."
docker ps -q > $container_history_path"containers-$(date +'%Y%m%d%H%M%S').txt";

echo "stop all running containers..."
while read p; do docker stop $p  ; done < $container_tmp_path"latest_container_list.txt";
docker stop 6ac8fb6c891f;

echo "containers successfully stoped..."

docker ps;


