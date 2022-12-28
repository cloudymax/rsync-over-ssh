#!/bin/bash

export REMOTE_USER="$USER"
export REMOTE_DIR="/home/$USER/"
export REMOTE_HOST=$2
export REMOTE_PORT=""
export FILE=$1
export CYPHER='aes256-gcm@openssh.com'
export SSH_KEY_FILE='/home/$USER/.ssh/id_rsa'
export LOG_FILE='/var/log/xfer.log'
export FORMAT='json'
export RSYNC_SKIP_COMPRESS='3fr/3g2/3gp/3gpp/7z/aac/ace/amr/apk/appx/appxbundle/arc/arj/arw/asf/avi/bz2/cab/cr2/crypt[5678]/dat/dcr/deb/dmg/drc/ear/erf/flac/flv/gif/gpg/gz/iiq/iso/jar/jp2/jpeg/jpg/k25/kdc/lz/lzma/lzo/m4[apv]/mef/mkv/mos/mov/mp[34]/mpeg/mp[gv]/msi/nef/oga/ogg/ogv/opus/orf/pef/png/qt/rar/rpm/rw2/rzip/s7z/sfx/sr2/srf/svgz/t[gb]z/tlz/txz/vob/wim/wma/wmv/xz/zip'


rsync --times \
--archive \
--log-file='$LOG_FILE' \
--inplace \
--checksum \
--compress \
--skip-compress='$RSYNC_SKIP_COMPRESS' \
--recursive \
--human-readable \
--verbose \
--progress \
-p -b -e "ssh -i $SSH_KEY_FILE -o StrictHostKeyChecking=no -o ControlMaster=no -o ControlPath=none -T -p $REMOTE_PORT -c $CYPHER -o Compression=no -x" "$FILE" "$USER"@"$REMOTE_HOST":"$REMOTE_DIR"
