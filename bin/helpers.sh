COLOR_RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
WHITE='\033[0m'
RED='\033[0;31m'

function set_color() {
  printf "${1}"
}

function notification_message() {
  printf "${BLUE}${1}${WHITE}\n"
}

function success_message() {
  printf "${GREEN}${1}${WHITE}\n"
}

function warning_message() {
  printf "${YELLOW}${1}${WHITE}\n"
}

function error_message() {
  printf "${RED}${1}${WHITE}\n"
}

root="src/components"

: << 'COMMENT'
renames the given component
COMMENT
function rename_component() {
  local path="$root/$1"

  for ext in "css" "tsx" "test.tsx" "stories.tsx"; do
    local src="$path/$1.$ext"
    local dest="$path/$2.$ext"

    sed "s/$1/$2/g" $src > $dest
    rm $src

  done

  sed -i "" "s/Temp/$2/g" "src/components/$1/index.ts"
  mv "$path" "$root/$2"
}

: << 'COMMENT'
returns the input string with the fist letter capitalizer
name => Name
input => Input
COMMENT
function camelerize() {
    echo `echo ${1:0:1} | tr  '[a-z]' '[A-Z]'`${1:1}
}

function folder_exists () {
    if [ -d $1 ] ; then
      echo 1
    fi

    return 0
}