#!/bin/sh

# Script for packaging application
# into a .dmg image

_APP_NAME="Lock"
_APP_PATH="Lock.app"
_IMAGE_NAME='lock'
_TMP_IMAGE="tmp/$_IMAGE_NAME-$(date +"%Y%m%d_%H%M%S")-tmp.dmg"
_DEST_IMAGE="dist/$_IMAGE_NAME.dmg"
_EXP_IMG_SIZE=68000

# Check is app available under given path
if [ ! -d "$_APP_PATH" ]; then
  echo "ERROR: Application not found under path $_APP_PATH"
  exit 1
fi

# Backup target image if exists
if [ -f "$_DEST_IMAGE" ]; then
  mv "$_DEST_IMAGE" "dist/$_IMAGE_NAME-$(date +"%Y%m%d_%H%M%S")-bck.dmg"
fi

# Create tmp and dist folders
mkdir -p tmp dist

# Create an initial disk image (10 megs)
hdiutil create -size 10m -fs HFS+ -volname "$_APP_NAME" "$_TMP_IMAGE"

# Mont the disk image and Obtain device information
DEVS=$(hdiutil attach "$_TMP_IMAGE")
#/dev/disk2              GUID_partition_scheme
#/dev/disk2s1            Apple_HFS                       /Volumes/Lock
echo "$DEVS"

DEV=$(echo "$DEVS" | cut -f 1 -d ' ' | head -n 1)
#/dev/disk2
echo "Detected device: $DEV"

VOL=$(echo "$DEVS" | grep "${DEV}s" | awk '{$1=$1};1' | cut -d' ' -f3-)
#/Volume/Lock
echo "Detected volume: $VOL"

# copy app into the mounted image
cp -r "$_APP_PATH" "$VOL"

# Unmount the disk image
hdiutil detach "$DEV"

# Convert the disk image to read-only
hdiutil convert "$_TMP_IMAGE" -format UDZO -o "$_DEST_IMAGE"

# Remove tmp image
rm "$_TMP_IMAGE"

# Check compressed image size
IMG_SIZE=$(stat "$_DEST_IMAGE" | cut -f 8 -d ' ')
#68552
if [ "$_EXP_IMG_SIZE" -gt "$IMG_SIZE" ]; then
  echo "ERROR: compressed image size should be atlases $_EXP_IMG_SIZE current size is: $IMG_SIZE"
  exit 1
fi
