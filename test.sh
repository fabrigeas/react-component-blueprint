package_name="react-component-blueprint"
playground_name="$package_name-playground_name"
component_name="Fabrice"
sudo npm link
cd ..
rm -rf $playground_name
mkdir $playground_name
cd $playground_name
npm init --yes
npm link "$package_name"
npx create "$component_name"
npx delete $component_name
npx delete "Feugang"
npx delete "Kemegni"