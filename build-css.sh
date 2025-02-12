#!/bin/bash

echo vdlcss
echo This script minifies the CSS and adds a comment at the beginning of the file.
echo To publish a new version, please pass the 'tag' parameter to this script. E.g. './build-css.sh tag'
echo

bun run sass src/styles.scss dist/vdlcss.css
bun run css-minify -f dist/vdlcss.css -o dist/
rm dist/vdlcss.css

if [ "$1" == "tag" ]; then
    current_tag=$(git describe --abbrev=0 --tags)
    echo Current version: $current_tag
    read -p "Enter a new tag: " new_tag

    echo "/*" >> dist/vdlcss-min.css
    echo " * vdlcss" >> dist/vdlcss-min.css
    echo " * Version: $new_tag" >> dist/vdlcss-min.css
    echo " * License: MIT" >> dist/vdlcss-min.css
    echo " * Source: https://vdlcss.cldv.org" >> dist/vdlcss-min.css
    echo " * by ColdIV" >> dist/vdlcss-min.css
    echo " */" >> dist/vdlcss-min.css

    cat dist/vdlcss.min.css >> dist/vdlcss-min.css
    rm dist/vdlcss.min.css

    read -p "What has changed: " changes
    echo "Committing changes:"
    git add .
    git commit -m "$changes"
    echo "Creating tag: $new_tag"
    git tag "$new_tag"
    git push
    git push --tags
else
    mv dist/vdlcss.min.css dist/vdlcss-min.css
fi