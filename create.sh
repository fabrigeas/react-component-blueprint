
#! /usr/bin/env node

# Author: Fabrice Feugang Kemegni

if [ $# -eq 0 ] ; then
    echo "please provide component name!"
    exit 1
fi

destinationFolder="src/components"

function camelerize() {
    echo `echo ${1:0:1} | tr  '[a-z]' '[A-Z]'`${1:1}
}

function verify_destination_folder() {
    if [ ! -d $destinationFolder ] ; then
        echo "Destination '$destinationFolder' folder is missing. I am creating it now"
        mkdir -p $destinationFolder
        echo "done!"
    fi

    return 0
}

function delete_duplicate_component() {
    componentPath=$1

    if [ -d $componentPath ] ; then
        echo "Component '$componentPath' already exists!"
        exit 1
        # rm  -rf $componentPath
    fi
}

function create_component_from_blueprint() {
    componentPath=$1

    echo "Cloning component into > '$componentPath' ..."
    cp -r node_modules/react-component-blueprint/component/ $componentPath
    echo "Successfully created '$componentPath'!"

    return 0
}

function rename_blueprints() {
    path=$1
    name=$2

    echo "Cleanup ..."
    for ext in "css" "tsx" "test.tsx"; do
        src="$path/Temp.$ext"
        dest="$path/$name.$ext"
        echo "Renaming $src => $dest"
        mv $src $dest
    done

    return 0
}

function create_component() {
    name=$(camelerize $1)
    path="$destinationFolder/$name"

    echo "Creating component '$name'"

    verify_destination_folder
    delete_duplicate_component $path
    create_component_from_blueprint $path
    rename_blueprints $path $name

    echo "'$path' succesfully created :D" 
}

for name in "$@"; do
    create_component $name
done

