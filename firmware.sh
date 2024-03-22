echo '[-] Downloading from: https://api.ipsw.me/v2.1/firmwares.json'
curl -m 120 -s 'https://api.ipsw.me/v2.1/firmwares.json' -o 'misc/firmwares.json'

if [ -s 'misc/firmwares.json' ]; then
    echo '[-] Validating:' 'misc/firmwares.json'

    version_number="11"   # Set the version number here
    device_name="iphone10,6"  # Set the device name here

    # Extracting versions based on the specified version number and device name (case-insensitive)
    versions=$(jq -r --arg version "$version_number" --arg device "$device_name" \
        '.devices | to_entries[] | select(.key | test($device; "i")).value.firmwares[] | select(.version | startswith($version)) | .version' \
        'misc/firmwares.json')

    if [ -n "$versions" ]; then
        echo '[-] Available versions:'
        echo "$versions"
    else
        echo '[-] No versions found.'
    fi
fi