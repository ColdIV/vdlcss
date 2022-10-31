# vdlcss
This is supposed to compile to a small base CSS file which can be used for small website projects without having to touch the CSS too much.

# Usage
Just include `vdlcss-min.css` in your HTML, and you are good to go!

You can find it [here](https://github.com/ColdIV/vdlcss/blob/master/dist/vdlcss-min.css).

To support responsive styles, you should include the following line as well:

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

Here you can find a demo and some instructions: [cldv.org/vdlcss/](http://www.cldv.org/vdlcss/)

# Build
## Requirements
- Python 3.8.1

## Windows
- Create venv `python -m venv .env`
- Activate venv `.env\Scripts\activate`
- Install requirements `pip install -r requirements.txt`

### Build CSS
- Run `build-css.bat`
- Or run `build-css.bat tag` to add a new tag to be released