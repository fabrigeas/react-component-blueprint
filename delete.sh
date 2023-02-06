
#! /usr/bin/env node

# Author: Fabrice Feugang Kemegni

if [ $# -eq 0 ] ; then
    echo "please provide component name to delete!"
    exit 1
fi

destinationFolder="src/components"

function delete_component() {
  path="$destinationFolder/$1"

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
