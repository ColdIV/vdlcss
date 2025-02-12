# vdlcss
A small css file which can be used for small website projects without having to touch the styles too much.

__Note__: This is mainly (only?) used by me, so I usually add things when I need them. Thus there may be many changes between versions. I do not recommend blindly updating. You can always check the [website](https://vdlcss.cldv.org) to see how the current version looks like.

## Usage
Just include `vdlcss-min.css` in your HTML, and you are good to go!

You can find it [here](https://github.com/ColdIV/vdlcss/blob/master/dist/vdlcss-min.css).

To support responsive styles, you should include the following line as well:

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

Here you can find a demo and some instructions: [vdlcss.cldv.org](https://vdlcss.cldv.org/)

## Build
### Requirements
- npm
    - sass, css-minify

Install with: `npm install -g sass less css-minify`

#### Build CSS
I am using `sass` from npm to merge the scss files to one css file.

Run with `sass src/styles.scss dist/vdlcss.css`

And then I use `css-minify` to minify the css file.

`css-minify -f dist/vdlcss.css -o dist/vdlcss-min.css`

## License
[MIT](https://github.com/ColdIV/vdlcss/blob/master/LICENSE)
