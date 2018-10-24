#!/bin/sh
SRC_FILE=$1
DST_PATH=$2

help() {
    {
        echo 'How to Use:'
        echo '    command SRC_FILE DST_PATH'
    } >&2
}

if [ -z "$DST_PATH" ]; then
    echo "ERROR!! : missing DST_PATH" >&2
    help
    exit 1
fi

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo "[${red}ERROR${normal}] $1"
}

# Check ImageMagick
command -v convert >/dev/null 2>&1 || { error >&2 "The ImageMagick is not installed. Please install it first.see http://www.imagemagick.org/"; exit -1; }

if [ -z $SRC_FILE ]
  then
    echo "No argument given"
else
  convert "$SRC_FILE" -resize 29x29     "$DST_PATH/Icon-Small.png"
  convert "$SRC_FILE" -resize 40x40     "$DST_PATH/Icon-Small-40.png"
  convert "$SRC_FILE" -resize 50x50     "$DST_PATH/Icon-Small-50.png"
  convert "$SRC_FILE" -resize 57x57     "$DST_PATH/Icon.png"
  convert "$SRC_FILE" -resize 58x58     "$DST_PATH/Icon-Small@2x.png"
  convert "$SRC_FILE" -resize 60x60     "$DST_PATH/Icon-60.png"
  convert "$SRC_FILE" -resize 72x72     "$DST_PATH/Icon-72.png"
  convert "$SRC_FILE" -resize 76x76     "$DST_PATH/Icon-76.png"
  convert "$SRC_FILE" -resize 80x80     "$DST_PATH/Icon-Small-40@2x.png"
  convert "$SRC_FILE" -resize 87x87     "$DST_PATH/Icon-Small@3x.png"
  convert "$SRC_FILE" -resize 100x100   "$DST_PATH/Icon-Small-50@2x.png"
  convert "$SRC_FILE" -resize 114x114   "$DST_PATH/Icon@2x.png"
  convert "$SRC_FILE" -resize 120x120   "$DST_PATH/Icon-60@2x.png"
  convert "$SRC_FILE" -resize 144x144   "$DST_PATH/Icon-72@2x.png"
  convert "$SRC_FILE" -resize 152x152   "$DST_PATH/Icon-76@2x.png"
  convert "$SRC_FILE" -resize 167x167   "$DST_PATH/Icon-83.5@2x.png"
  convert "$SRC_FILE" -resize 180x180   "$DST_PATH/Icon-60@3x.png"
  convert "$SRC_FILE" -resize 512x512   "$DST_PATH/iTunesArtwork"
  convert "$SRC_FILE" -resize 1024x1024 "$DST_PATH/iTunesArtwork@2x"
fi
