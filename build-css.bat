@echo off

echo vdlcss
echo This script minifies the CSS and adds a comment at the beginning of the file.
echo To publish a new version, please pass the `tag` parameter to this script. E.g. `build-css.bat tag`
echo If you just want to minify properly, use `css` as parameter.
echo.

::Merges all SCSS files to one, not very optimal when it comes to minimising.
:: Unfortunately the library pyscss is not working for python > 3.10
::python -m scss < src/styles.scss -o dist/vdlcss-min.css -I src/
:: For the following you need npm. Install with: npm install -g sass less
call sass src/styles.scss dist/vdlcss-min.css

::We don't make an API call for development
if "%~1" == "" goto :end

::Properly minify CSS
python minify-css.py

::Get current tag and store in variable
FOR /F "tokens=*" %%g IN ('git describe --tags --match "v*" --abbrev^=0') do (SET current_tag=%%g)
echo Current tag: %current_tag%
::Skip git-related lines when called with `css` as argument
if "%~1" == "css" goto :skipnewtag
set /p new_tag= "New tag: "
goto :skipoldtag
:skipnewtag
set new_tag=%current_tag%
:skipoldtag

::Add comment on top of minified CSS
cd dist/
move vdlcss-min.css vdlcss-min.css.tmp

echo /* >> vdlcss-min.css
echo  * vdlcss >> vdlcss-min.css
echo  * Version: %new_tag% >> vdlcss-min.css
echo  * License: MIT >> vdlcss-min.css
echo  * Source: https://vdlcss.cldv.org >> vdlcss-min.css
echo  * by ColdIV >> vdlcss-min.css
echo  */ >> vdlcss-min.css

type vdlcss-min.css.tmp >> vdlcss-min.css
del vdlcss-min.css.tmp
cd ..

::Skip git-related lines when called with `css` as argument
if "%~1" == "css" goto :end
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
