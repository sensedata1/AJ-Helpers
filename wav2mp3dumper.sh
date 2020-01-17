#!/bin/bash

# wav2mp3dumper

# Redcursively convert all .wav files to .mp3, 
# renaming to _.mp3 to avoid overwriting existing files 
# then move contents of $AJ_TEMP_DIR to $DUMP_DIR 
# before deleting .wav files 


AJ_TEMP_DIR='/Volumes/ProjectsDrive/General Downloads/AJ TEMP DOWNLOADS'
DUMP_DIR='/Users/blord/Dropbox/DUMPER'

cd "$AJ_TEMP_DIR"

find . \
  -type f \
  -name *.wav \
  -exec bash -c ' \
  ffmpeg -i "$0" -c:a libmp3lame \
  -q:a 1 "${0/%.wav/_.mp3}" ' {} \;

mv -f  "$AJ_TEMP_DIR"/* "$DUMP_DIR"

cd $DUMP_DIR

find . -type f -name '*.wav' -delete -print
