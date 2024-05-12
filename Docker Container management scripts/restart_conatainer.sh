#!/bin/bash
# created by  Chandiman Keerthi
# dmo_env_container_restart : Owned By Implementation Team
#Do not make any chages without Informing to the Responsible Persons

container_tmp_path=/home/ibl_q_dkr/DO_NOT_DELETE/container_tmp/
container_history_path=/home/ibl_q_dkr/DO_NOT_DELETE/container_history/restart_container

echo "Initialized container restart..."

echo "deleting previous containers detail list..."
rm $container_tmp_path"latest_container_list.txt";

echo "taking running container IDs..."
docker ps -q | grep -v "6ac8fb6c891f" > $container_tmp_path"latest_container_list.txt";

echo "storing running container IDs..."
docker ps -q > $container_history_path"containers-$(date +'%Y%m%d%H%M%S').txt";

echo "stop all running containers..."
while read p; do docker stop $p  ; done < $container_tmp_path"latest_container_list.txt";
docker stop 6ac8fb6c891f;

echo "start the containers..."

echo "start the 'test-password-server' container..."
docker start 6ac8fb6c891f


echo "start the other containers..."
while read p; do docker start $p  ; done < $container_tmp_path"latest_container_list.txt";


echo "containers successfully restarted..."

docker ps;


