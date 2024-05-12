#!/bin/bash
# created by  Chandiman Keerthi
# dmo_env_container_management : Owned By Implementation Team
#Do not make any chages without Informing to the Responsible Persons
echo ""
echo "<<<< DMO Enviornment Container Management Tool >>>>"
echo ""
echo "Enter your choice:"
echo ""
echo "1. Start Instance Running Containers"
echo "2. Stop Running Containers"
echo "3. Restart Running Containers"
echo "4. Logs Clearing"
echo "5. Bash History Clearing"
echo "6. Quit"
echo ""
read -p "Choice: " user_choice
echo ""
case $user_choice in
    1)
        scripts/./start_container.sh
        ;;
    2)
        scripts/./stop_container.sh
        ;;
    3)
        scripts/./restart_container.sh
        ;;
    4)
        scripts/./logs_cleaning.sh
        ;;
    5)
        scripts/./bash_history_clearing.sh
        ;;
    6)
        echo "Exiting..."
        ;;
    *)
        echo "Invalid choice. Exiting..."
        ;;
esac

echo ""
echo "Thank You ...!"
echo ""