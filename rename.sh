
#! /usr/bin/env bash

# Author: Fabrice Feugang Kemegni

source ../react-component-blueprint/bin/helpers.sh

if [ $# -lt 2 ] ; then
    echo "please provide component name to delete!"
    exit 1
fi

if [ $1 = $2 ] ; then
  echo "source and destination must be different"
  exit 1
fi

src=$1
dest=$2
path="src/components"

function component_does_not_exists() {
  if [ ! -d "$path/$1" ] ; then
    return  0
  fi
  return 1
}

function main() {
  if component_does_not_exists $src; then
    exit
  fi

  if ! component_does_not_exists $dest; then
    echo "$path/$dest already exists"
    exit
  fi

  # see helpers.sh rename_component
  rename_component $src $dest
}

main