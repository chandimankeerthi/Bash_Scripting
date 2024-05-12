#!/bin/bash
# created by  Chandiman Keerthi
# loading_images : Owned By Implementation Team
#Do not make any chages without Informing to the Responsible Persons

# Function to load Docker images from tar files
load_images_from_tar() {
    tar_directory="/home/devops/devops/output_images_new/"  # Replace with the actual path
    tar_files="$tar_directory/*.tar"

    for tar_file in $tar_files
    do
        echo "Loading Docker image from $tar_file"
        docker load -i "$tar_file"
    done
}

# Execute the function to load images
load_images_from_tar

echo "Images loaded successfully"
