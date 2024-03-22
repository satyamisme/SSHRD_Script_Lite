#!/usr/bin/bash

# List of iOS versions
ios_versions=("14.4" "14.5" "16.7.4" "15.5")
product_name=("iPhone10,6")

# Optional tags
enable_gaster=false
patch_iboot64patcher_with=false
patch_ibootpatcher_withkairos=false
pack_img4_with=false
pack_img4tool_with=false

# Iterate over each iOS version
for ios_version in "${ios_versions[@]}"; do
    echo "Building ram disk for iOS version $ios_version"

    # Add your build logic here for the specific iOS version
    # You can use the $ios_version variable to customize the build process

    # Example commands:
    # - Run specific commands to build the ram disk for the iOS version
    # - Specify the necessary options and parameters based on the version

    # Enable/disable decrypting with gaster
    gaster_switch=""
    if [ "$enable_gaster" = true ]; then
        gaster_switch="-g"
    fi

    # Determine the value for --patch-iboot-with
    patch_iboot_option=""
    if [ "$patch_iboot64patcher_with" = true ]; then
        patch_iboot_option="--patch-iboot-with 1"
    elif [ "$patch_ibootpatcher_withkairos" = true ]; then
        patch_iboot_option="--patch-iboot-with 2"
    fi

    # Determine the value for --pack-img4-with
    pack_img4_option=""
    if [ "$pack_img4_with" = true ]; then
        pack_img4_option="--img4"
    elif [ "$pack_img4tool_with" = true ]; then
        pack_img4_option="--pack-img4-with 2"
    fi

    # Call the sshrd_lite.sh script with the appropriate options
    bash sshrd_lite.sh -p "${product_name}" -s "$ios_version" "$gaster_switch" "$patch_iboot_option" "$pack_img4_option"

    # End of build logic for the specific iOS version

    echo "Ram disk build completed for iOS version $ios_version"
    echo
done