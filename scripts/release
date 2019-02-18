#!/usr/bin/env bash

set -e

echo "making release"

minor="v1.0"
prev_version=$(git tag -l "$minor.*" --sort -version:refname | head -n 1)


if [ "$prev_version" == "" ]
then
    patch="0"
else
    prev_patch=$(echo "$prev_version" | cut -d . -f 3)
    patch=$((prev_patch+1))
fi

version="$minor.$patch"

echo "updating version in mix file"

sed -i '' -e "/version/s/${prev_version/v/}/${version/v/}/g" mix.exs

git add mix.exs
git commit -m "Update version in mix.exs to ${version/v/}"
git push origin master

echo "set tag"

git tag $version
git push --tags