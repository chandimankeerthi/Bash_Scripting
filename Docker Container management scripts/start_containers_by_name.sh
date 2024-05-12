#!/bin/bash
# created by  Chandiman Keerthi
# dmo_env_container_start_by_name : Owned By Implementation Team
#Do not make any chages without Informing to the Responsible Persons

echo ""
echo "Initialized container start..."
echo ""
echo "Listing containers related to the 'Password Servers'.... "
echo ""
echo " 
       1. test-password-server   
       2. test-password-server-new   
       3. test-password-server-old"
echo ""
echo "Listing general containers .... "
echo ""
echo " 
       1. mon-portainer "
echo ""
echo "Listing containers related to the 'ISWICTH'.... "
echo ""
echo " 
       1. test-switch-transaction-engine   
       2. test-switch-credit-backend   
       3. test-switch-castor"
echo ""
echo "Listing containers related to the 'Other Modules'.... "
echo ""
echo "
       1. test-irecon-web
       2. test-iadmin-web
       3. test-ipay-web
       4. test-icard-web
       5. test-switch-pylon-castor
       6. test-card-loyalty-api-gateway
       7. test-loyalty-services-discovery-server
       8. test-loyalty-services-config-server
        "
echo ""

# Prompt the user for input
read -p "Enter the container names you want to start (separated by spaces): " container_names

# Check if container_names is not empty
if [ -n "$container_names" ]; then
    # Loop through each container name
    for container_name in $container_names; do
        # Start the specified container
        docker start "$container_name"
    done
    #echo "Containers successfully started."
    echo ""
    docker ps
else
    echo "Invalid container names. Please provide valid container names separated by spaces."
fi
echo ""