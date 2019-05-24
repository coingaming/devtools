#!/usr/bin/env bash

set -e

echo "making release"

major="v1"
prev_version=$(git tag -l "$minor.*" --sort -version:refname | head -n 1)


if [ "$prev_version" == "" ]
then
    minor="1"
else
    prev_minor=$(echo "$prev_version" | cut -d . -f 2)
    minor=$((prev_minor+1))
fi

version="$major.$minor.0"

echo "updating version in mix file"

sed -i '' -e "/version/s/${prev_version/v/}/${version/v/}/g" mix.exs

git add mix.exs
git commit -m "Update version in mix.exs to ${version/v/}"
git push origin master

echo "set tag"

git tag $version
git push --tags