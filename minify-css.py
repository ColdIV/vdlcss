#!/usr/bin/env python3
import requests
mincssFile = open("dist/vdlcss-min.css","r+")
mincssContent = mincssFile.read()
mincssFile.close()

response = requests.post('https://www.toptal.com/developers/cssminifier/api/raw', data=dict(input=mincssContent)).text

mincssFile = open("dist/vdlcss-min.css","w+")
mincssFile.write(response)
mincssFile.close()
