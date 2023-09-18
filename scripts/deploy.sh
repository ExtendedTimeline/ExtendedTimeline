#!/bin/bash
set -e

VERSION=$*
PROJECT_NAME="ExtendedTimeline" 
PROJECT_NAME_SPACED="EXTENDED TIMELINE" 
PROJECT_FILES=("common" "events" "gfx" "interface" "localisation" "descriptor.mod" "LICENSE" "README.md", "thumbnail.png")

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_ROOT_DIR="$(dirname "$SCRIPT_DIR")"
BUILD_FOLDER="$PROJECT_ROOT_DIR/release/build"

#python3 $SCRIPT_DIR/make.py

function createRelease () {
  [[ "$1" == "" ]] && echo "Making Release"
  [[ "$1" == "steambuild" ]] && echo "Making Steam Release"

  cd $PROJECT_ROOT_DIR
  mkdir -p $BUILD_FOLDER/$PROJECT_NAME

  for I in ${PROJECT_FILES[@]}
  do
    [ -d "$I" ] || [ -f "$I" ] && echo "  copying: $I for release"
    [ -d "$I" ] || [ -f "$I" ] && cp -Rp "$I" "$BUILD_FOLDER/$PROJECT_NAME/."
  done

  echo "Writing descriptor.mod"
  [ ! -z $VERSION ] && sed -i "s/0.0.0/${VERSION}/" $BUILD_FOLDER/$PROJECT_NAME/descriptor.mod
  sed -i "s/ DevBuild//" $BUILD_FOLDER/$PROJECT_NAME/descriptor.mod
  sed -i "s/_DevBuild//" $BUILD_FOLDER/$PROJECT_NAME/descriptor.mod

  sed -i "s/UTNH_DEV/Ultimate Tech Tree : New Horizon/" $BUILD_FOLDER/$PROJECT_NAME/descriptor.mod
  [[ "$1" == "steambuild" ]] && _remoteId="remote_file_id=\"2747306152\""
  [[ "$1" == "steambuild" ]] && echo -e "\n\n$_remoteId" >> $BUILD_FOLDER/$PROJECT_NAME/descriptor.mod

  cp $BUILD_FOLDER/$PROJECT_NAME/descriptor.mod $BUILD_FOLDER/$PROJECT_NAME.mod

  # Readme
  [ -f "$PROJECT_ROOT_DIR/release/$PROJECT_NAME/README.md" ] && echo "Writing README.md"
  [ -f "$PROJECT_ROOT_DIR/release/$PROJECT_NAME/README.md" ] && sed -i "s/# $PROJECT_NAME_SPACED/# $PROJECT_NAME_SPACED v${VERSION}/" $PROJECT_ROOT_DIR/release/$PROJECT_NAME/README.md
  [ -f "$PROJECT_ROOT_DIR/release/$PROJECT_NAME/README.md" ] && sed -i "2,8d" $PROJECT_ROOT_DIR/release/$PROJECT_NAME/README.md

  # Build archive
  [[ "$1" == "" ]] && echo "Building archive $PROJECT_NAME.zip"
  [[ "$1" == "steambuild" ]] && echo "Building archive ${PROJECT_NAME}_steambuild.zip"
  cd $BUILD_FOLDER

  [[ "$1" == "" ]] && zip $PROJECT_NAME.zip -r *
  [[ "$1" == "steambuild" ]] && zip "${PROJECT_NAME}_steambuild.zip" -r *

  echo "Cleaning up"
  [[ "$1" == "steambuild" ]] && mv $BUILD_FOLDER/$PROJECT_NAME $BUILD_FOLDER/../$PROJECT_NAME
  [[ "$1" == "" ]] && mv $BUILD_FOLDER/$PROJECT_NAME.zip $BUILD_FOLDER/../$PROJECT_NAME.zip
  [[ "$1" == "steambuild" ]] && mv $BUILD_FOLDER/"${PROJECT_NAME}_steambuild.zip" $BUILD_FOLDER/../"${PROJECT_NAME}_steambuild.zip"

  rm -rf $BUILD_FOLDER
}

createRelease
createRelease steambuild
