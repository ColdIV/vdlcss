@echo off

echo vdlcss
echo This script minifies the CSS and adds a comment at the beginning of the file.
echo To publish a new version, please pass the `tag` parameter to this script. E.g. `build-css.bat tag`
echo .

::Merges all SCSS files to one, not very optimal when it comes to minimising.
python -m scss < src/styles.scss -o dist/vdlcss-min.css -I src/

::We don't make an API call for development
if NOT "%~1" == "tag" goto :end

::Properly minify CSS
python minify-css.py

::Get current tag and store in variable
FOR /F "tokens=*" %%g IN ('git describe --tags --match "v*" --abbrev^=0') do (SET current_tag=%%g)
echo Current tag: %current_tag%
set /p new_tag= "New tag: "

::Add comment on top of minified CSS
cd dist/
move vdlcss-min.css vdlcss-min.css.tmp

echo /* >> vdlcss-min.css
echo  * vdlcss >> vdlcss-min.css
echo  * Version: %new_tag% >> vdlcss-min.css
echo  * License: MIT >> vdlcss-min.css
echo  * Source: https://www.cldv.org/vdlcss/ >> vdlcss-min.css
echo  * by ColdIV >> vdlcss-min.css
echo  */ >> vdlcss-min.css

type vdlcss-min.css.tmp >> vdlcss-min.css
del vdlcss-min.css.tmp
cd ..

::Committing changes
set /p changes= "What has changed: "
echo Committing changes:
git add .
git commit -m "%changes%"
echo Creating tag: %new_tag%
git tag %new_tag%
git push
git push --tags

echo The new version is: %new_tag%
echo All changes have been committed and pushed.
:end
