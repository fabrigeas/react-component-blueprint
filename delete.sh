#! /usr/bin/env node

if [ $# -eq 0 ] ; then
    echo "please provide component name to delete!"
    exit 1
fi

destinationFolder="src/components"

verify_destination_folder() {
    if [ ! -d $destinationFolder ] ; then
        echo "'$destinationFolder' folder is does not exist!"
      exit 0
    fi
}

delete_component() {
  if [ ! verify_destination_folder ]; then
    exit 1
  fi

  path="$destinationFolder/$1"

  if [ ! -d $path ] ; then
    echo "Component '$path' is does not exist!"
    exit 0
  fi

  rm -rf $path

  echo "Component $path succesfully deleted!"
}

for name in "$@"; do
    delete_component $name
done
