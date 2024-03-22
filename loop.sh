#!/usr/bin/bash

# List of iOS versions
ios_versions=("14.4" "14.5")
product_name=("iPhone10,6")

# Iterate over each iOS version
for ios_version in "${ios_versions[@]}"; do
    echo "Building ram disk for iOS version $ios_version"

    # Add your build logic here for the specific iOS version
    # You can use the $ios_version variable to customize the build process

    # Example commands:
    # - Run specific commands to build the ram disk for the iOS version
    # - Specify the necessary options and parameters based on the version
    
    # Call the sshrd_lite.sh script with the appropriate options
    bash sshrd_lite.sh -p "${product_name}" -s "$ios_version"

    # End of build logic for the specific iOS version

    echo "Ram disk build completed for iOS version $ios_version"
    echo
done