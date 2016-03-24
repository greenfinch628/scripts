#!/bin/bash

# i changed this

EXCLUDES=(
 --exclude '\.*'
 --exclude '*.vdi.0'
 --exclude '*.vdi'
 --exclude '*.iso'
 --exclude '*.zip'
 --exclude '*.box'
 --exclude '*.rpm'
 --exclude '*.tar'
 --exclude '*.gz'
 --exclude '*.gif'
 --exclude '*.qcow2'
 --exclude 'consul-data'
 --exclude 'consul'
)

TS=$(date "+%Y%m%d%H%M%S")
TS=$(date "+%m%d%H%M%S")

OUTFILE=/home/rczys/Desktop/syncit-logs/${TS}-syncit.txt

date > $OUTFILE
echo >> $OUTFILE
echo syncing Docker ------------------------------------------------------------------- >> $OUTFILE
SOURCE=/home/rczys/Docker
TARGET=/home/rczys/Dropbox/work/centos7-lab
rsync -arvz --delete -a "${EXCLUDES[@]}" $SOURCE $TARGET >> $OUTFILE

echo >> $OUTFILE
echo syncing vagrant ------------------------------------------------------------------ >> $OUTFILE
SOURCE=/home/rczys/vagrant
TARGET=/home/rczys/Dropbox/work/centos7-lab
rsync -arvz --delete -a "${EXCLUDES[@]}" $SOURCE $TARGET >> $OUTFILE

echo >> $OUTFILE
echo syncing Documents----------------------------------------------------------------- >> $OUTFILE
SOURCE=/home/rczys/Documents
TARGET=/home/rczys/Dropbox/work/centos7-lab
rsync -arvz --delete -a "${EXCLUDES[@]}" $SOURCE $TARGET >> $OUTFILE


