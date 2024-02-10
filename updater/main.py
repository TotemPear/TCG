import requests
from os import startfile
import os.path
import json



try:
    version = json.loads(requests.get("https://baka-tcg-default-rtdb.firebaseio.com/system/.json").text)

    

    # if _sub != _newVersion[?"sub-version"]{
    # if (_sub == "alpha"){
    # if (_newVersion[?"sub-version"] == "beta") global.isNewVersion = true;
    # else if (_newVersion[?"sub-version"] == "") global.isNewVersion = true;
    # } else if (_sub == "beta") & & (_newVersion[?"sub-version"] == "") global.isNewVersion = true;
    # }
except requests.ConnectionError:
    startfile("AutoClicker.exe")
    exit()
