#!/bin/bash
# created by  Chandiman Keerthi
# image_building_by_conatiners_and_save_to_tar : Owned By Implementation Team
#Do not make any chages without Informing to the Responsible Persons

# Function to list all exited containers
list_exited_containers() {
    echo "Listing exited containers:"
    docker ps -a --filter "status=exited"
}

# Function to create images from exited containers
create_images() {
    containers=$(docker ps -a --filter "status=exited" --format "{{.Names}}")
    for container in $containers
    do
        image_name="$container:latest_devops"
        echo "Creating image from $container: $image_name"
        docker commit "$container" "$image_name"
    done
}

# Function to save images into separate tar files
save_images_to_tar() {
    containers=$(docker ps -a --filter "status=exited" --format "{{.Names}}")
    for container in $containers
    do
        image_name="$container:latest_devops"
        tar_file="$container:latest_devops.tar"
        echo "Saving $image_name into $tar_file"
        docker save -o "$tar_file" "$image_name"
    done
}

# Function to move tar files to another server and remove from source server
move_and_remove_tar_files() {
    destination_server="devops@192.168.0.96"
    destination_path="/home/devops/devops/output_images_new/"
    password="devops"  # Replace with your actual password

    for tar_file in *.tar
    do
        echo "Moving $tar_file to $destination_server:$destination_path"
        sshpass -p "$password" scp "$tar_file" "$destination_server":"$destination_path"
        
        # Check if scp was successful before removing the file
        if [ $? -eq 0 ]; then
            echo "Removing $tar_file from source server"
            rm "$tar_file"
        else
            echo "Failed to move $tar_file to destination server. Check scp logs."
        fi
    done
}


# Execute functions
list_exited_containers
create_images
save_images_to_tar
move_and_remove_tar_files

echo "Process completed successfully"
