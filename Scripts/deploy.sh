#!/bin/bash

VERSION=$*
PROJECT_NAME="NextExtended"
PROJECT_FILES=common

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_ROOT_DIR="$SCRIPT_DIR/../"

mkdir $PROJECT_ROOT_DIR/release/

python3 $SCRIPT_DIR/make.py

cd $PROJECT_ROOT_DIR



for I in $OPROJECT_FILES
do
  echo "Copying $I for release"
  cp -R "$I" "$PROJECT_ROOT_DIR/release/."
done
