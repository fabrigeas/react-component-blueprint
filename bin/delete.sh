
#! /usr/bin/env node

# Author: Fabrice Feugang Kemegni

source node_modules/react-component-blueprint/bin/helpers.sh

if [ $# -eq 0 ] ; then
    echo "please provide component name to delete!"
    exit 1
fi

function delete_component() {
  path="src/components/$1"

  if [ ! -d $path ] ; then
    echo "Component '$path' does not exist!"
    exit 0
  fi

  rm -rf $path

  echo "Component $path succesfully deleted!"
}

for name in "$@"; do
    delete_component $name
done
