package_name="react-component-blueprint"
playground_name="$package_name-playground"

sudo npm link
cd ..
rm -rf $playground_name
mkdir $playground_name
cd $playground_name
ls
npm init --yes
npm link "$package_name"