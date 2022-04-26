echo "Flattening directory structure and formatting imports..."

format_imports() {
	yq -i '.imports[] |= sub(".*custom_types/", "")' $1
	yq -i '.imports[] |= sub("/", "_")' $1
	yq -i 'del(.imports | select(length==0))' $1
}
tmpdir=$PWD/flatpack_tmp
export -f format_imports
export tmpdir

mkdir $tmpdir

cd custom_types
find */ -type f -exec bash -c 'file=${1#./}; cp "$file" "$tmpdir/${file//\//_}"' _ '{}' \;
cd ..

cp micado_types.yaml $tmpdir

find $tmpdir -type f -exec bash -c 'format_imports "$@"' _ '{}' \;

tar -C $tmpdir -cf micado_types.tar ./

rm -r $tmpdir

echo "DONE"
