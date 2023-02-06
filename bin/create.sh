
#! /usr/bin/env node

# Author: Fabrice Feugang Kemegni

source node_modules/react-component-blueprint/bin/helpers.sh

if [ $# -eq 0 ] ; then
    echo "please provide component name!"
    exit 1
fi

components_root="src/components"
blueprint_name="Temp"

function assert_components_root_exists () {
    if [ ! -d $components_root ] ; then
        echo "Creating '$components_root/'"
        mkdir -p $components_root
    fi

    return 0
}

function clone_component_blueprint() {
    cp -r node_modules/react-component-blueprint/component/ "$components_root/$blueprint_name"
}

function create_component() {
    local name=$(camelerize $1)
    local path="$components_root/$name"

    assert_components_root_exists

    if [ $(folder_exists $path) ]; then
        echo "$path already exist!"
        exit
    fi

    clone_component_blueprint
    rename_component "$blueprint_name" $name

    echo "$path created" 
}

for n in "$@"; do
    create_component $n
done

