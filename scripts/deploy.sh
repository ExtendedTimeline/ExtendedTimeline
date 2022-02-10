#!/bin/bash
set -e

VERSION=$*
PROJECT_NAME="ExtendedTimeline" 
PROJECT_FILES=("common" "events" "gfx" "interface" "localisation" "ExtendedTimeline.mod" "LICENSE" "README.md")

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_ROOT_DIR="$(dirname "$SCRIPT_DIR")"

cd $PROJECT_ROOT_DIR

mkdir -p $PROJECT_ROOT_DIR/release/$PROJECT_NAME

#python3 $SCRIPT_DIR/make.py

for I in ${PROJECT_FILES[@]}
do
  echo "Copying $I for release"
  cp -Rp "$I" "$PROJECT_ROOT_DIR/release/$PROJECT_NAME/."
done

sed -i "s/0.0.0/${VERSION}/" $PROJECT_ROOT_DIR/release/$PROJECT_NAME/ExtendedTimeline.mod

cd $PROJECT_ROOT_DIR/release/
zip release/$PROJECT_NAME.zip -r $PROJECT_NAME
