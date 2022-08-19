python -m scss < src/styles.scss -o dist/vdlcss-min.css -I src/

cd dist/
move vdlcss-min.css vdlcss-min.css.tmp

echo /* >> vdlcss-min.css
echo  * vdlcss >> vdlcss-min.css
echo  * License: MIT>> vdlcss-min.css
echo  * Source: http://www.cldv.org/vdlcss/ >> vdlcss-min.css
echo  * by ColdIV >> vdlcss-min.css
echo  */ >> vdlcss-min.css

type vdlcss-min.css.tmp >> vdlcss-min.css
del vdlcss-min.css.tmp
