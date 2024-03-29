#!/bin/bash

# Project Treble Experience by Hitalo <hitalo331@outlook.com> and Velosh <daffetyxd@gmail.com>
# Written by Velosh <daffetyxd@gmail.com>

# Core variables, don't edit.
LOCALDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SYSTEMDIR="$1"
ROMDIR="$2"
AVERSION="$3"

# Start the process: Main
echo "[ZualoliconVN] => Checking if there is already Phonesky certification..."

# Init variable for Android version check
flag=false

# Start the process: Check Android version
case "$AVERSION" in
*"11"*) flag=true ;;
*"12"*) flag=true ;;
esac

# I need to say something?
if [ "$flag" == "false" ]; then
    echo "[ZualoliconVN] image is not supported for this patch.Abort."
    exit 1
fi

# Start the process: Check if the ROM already have a prebuilt play_store_fsi_cert.der
if [ -f "$SYSTEMDIR/product/security/fsverity/play_store_fsi_cert.der" ]; then
    echo "[ZualoliconVN] => Exists! No patching is required. Abort."
    exit 1
else
    rsync -ra $LOCALDIR/product $SYSTEMDIR
    cat $LOCALDIR/file_contexts >> $SYSTEMDIR/etc/selinux/plat_file_contexts
    echo "[ZualoliconVN] => Done, patched successfully. Process completed."
fi
