root="src/components"

: << 'COMMENT'
renames the given component
COMMENT
function rename_component() {
  path="$root/$1"

  for ext in "css" "tsx" "test.tsx"; do
    src="$path/$1.$ext"
    dest="$path/$2.$ext"

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