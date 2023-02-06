
#! /usr/bin/env node

# Author: Fabrice Feugang Kemegni

source node_modules/react-component-blueprint/bin/helpers.sh

if [ $# -eq 0 ] ; then
    error_message "Missing component name to delete!"
    exit 1
fi

function delete_component() {
  path="src/components/$1"

  if [ ! -d $path ] ; then
    warning_message "'$path' does not exist!"
    exit 0
  fi

  rm -rf $path

  success_message "'$path' Deleted"
}

for name in "$@"; do
    delete_component $name
done
