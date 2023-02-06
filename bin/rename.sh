
#! /usr/bin/env bash

# Author: Fabrice Feugang Kemegni

source node_modules/react-component-blueprint/bin/helpers.sh

if [ $# -eq 0 ] ; then
    error_message "Component name is missing"
    exit 1
fi

if [ $# -lt 2 ] ; then
    error_message "please provide component name to delete!"
    exit 1
fi

if [ $1 = $2 ] ; then
  error_message "source and destination must be different"
  exit 1
fi

path="src/components"

function component_does_not_exists() {
  if [ ! -d "$path/$1" ] ; then
    return  0
  fi
  return 1
}

function main() {
  local src=$1
  local dest=$(camelerize $2)

  if component_does_not_exists $src; then
    warning_message "$src does not exist"
    exit
  fi

  if ! component_does_not_exists $dest; then
    warning_message "$path/$dest already exists"
    exit
  fi

  # see helpers.sh rename_component
  rename_component $src $dest

  success_message "$src renamed"
}

main