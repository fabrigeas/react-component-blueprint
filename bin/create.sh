
#! /usr/bin/env node

# Author: Fabrice Feugang Kemegni

source node_modules/react-component-blueprint/bin/helpers.sh

if [ $# -eq 0 ] ; then
    echo "please provide component name!"
    exit 1
fi

destinationFolder="src/components"
blueprintName="Temp"

function verify_destination_folder() {
    if [ ! -d $destinationFolder ] ; then
        echo "Creating '$destinationFolder/'"
        mkdir -p $destinationFolder
    fi

    return 0
}

function verify_component_doesn_not_exist() {
    path="$destinationFolder/$1"

    if [ -d $path ] ; then
        echo "'$path' already exists!"
    fi
}

function clone_component_blueprint() {
    cp -r node_modules/react-component-blueprint/component/ "$destinationFolder/$blueprintName"
}

function create_component() {
    name=$(camelerize $1)
    path="$destinationFolder/$name"

    verify_destination_folder
    verify_component_doesn_not_exist $path
    clone_component_blueprint
    rename_component "$blueprintName" $name

    echo "'$path' succesfully created :D" 
}

for n in "$@"; do
    create_component $n
done

