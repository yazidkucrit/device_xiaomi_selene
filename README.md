# device_xiaomi_selene
tree build TWRP

HOW TO BUILD

# Create dirs
$ mkdir tw; cd tw

# Init repo
$ repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11

# Clone Selene repo
$ git clone https://github.com/yazidkucrit/device_xiaomi_selene.git device/xiaomi/selene

# Sync
$ repo sync --no-repo-verify -c --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j`nproc`

# Build
$ source build/envsetup.sh; lunch twrp_a12-eng; mka bootimage



STILL ON TEST BUILD
NOT ALL SOURCE READY

