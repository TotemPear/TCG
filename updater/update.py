from requests import get, ConnectionError
from json import loads
from configparser import ConfigParser
from shutil import rmtree, move
from os import remove, startfile, mkdir
from os.path import isfile, isdir
from getpass import getuser



installer = False

directory = "C:/Users/" + getuser() + "/AppData/Local/BakaTCG/"

currently_downloading = True

project_name = "TCG"

game_name = "BakaTCG.exe"


def download_file(url, destination):
    response = get(url)
    if response.status_code == 200:
        with open(destination, 'wb') as f:
            f.write(response.content)
    else:
        download_file(url, destination)


def extract():
    from zipfile import ZipFile, is_zipfile

    if is_zipfile(directory + "download.zip"):


        if isdir(directory + "data"):
            rmtree(directory + "data")

        mkdir(directory + "data")

        file_to_skip = "bakatcg-updater.exe"  # Adjust this to the name of the file you want to skip

        if isfile(directory + file_to_skip):
            if not installer:
                with ZipFile(directory + "download.zip", 'r') as zip_ref:
                    for file_info in zip_ref.infolist():
                        # Check if the current file is the one to skip
                        if file_info.filename == file_to_skip:
                            continue  # Skip extracting this file
                        # Extract other files
                        zip_ref.extract(file_info, directory + "data/")
            else:
                remove(directory + file_to_skip)
                with ZipFile(directory + "download.zip", 'r') as zip_ref:
                    zip_ref.extractall(directory + "data/")

                move(directory + "data/" + file_to_skip, directory)
        else:
            with ZipFile(directory + "download.zip", 'r') as zip_ref:
                zip_ref.extractall(directory + "data/")

            move(directory + "data/" + file_to_skip, directory)

        remove(directory + "download.zip")
        return True
    elif isfile(directory + "download.zip"):
        remove(directory + "download.zip")
    return False


def check_version():
    is_new_version = False

    new_version = loads(get("https://baka-tcg-default-rtdb.firebaseio.com/system/.json").text)

    new_sub = new_version["sub-version"]
    new_version = new_version["version"]

    sub = "alpha"
    version = "0"

    if isfile(directory + "info.ini"):
        config = ConfigParser()
        config.read(directory + "info.ini")
        try:
            sub = config["Version"]["Sub-Version"]
            version = config["Version"]["Version"]
        except KeyError:
            is_new_version = True

        if sub != new_sub:
            if sub == "alpha":
                if new_sub == "beta" or new_sub == "":
                    is_new_version = True
            elif sub == "beta" and new_sub == "":
                is_new_version = True
    else:
        is_new_version = True

    if not is_new_version:
        new_array = new_version.split(".")
        old_array = version.split(".")

        while len(new_array) > len(old_array):
            old_array.append("0")
        while len(old_array) > len(new_array):
            new_array.append("0")

        for i in range(len(new_array)):
            if int(new_array[i]) > int(old_array[i]):
                is_new_version = True
                break
            elif int(old_array[i]) > int(new_array[i]):
                break
    
    return is_new_version, new_sub, new_version


def install(download=False):
    import tkinter as tk
    update_working = False
    try:
        is_new_version, new_sub, new_version = check_version()

        download = download or is_new_version
        if not isdir(directory + "data"):
            download = True

        if download:
            def start_download():
                download_url = "https://github.com/TotemPear/" + project_name + "/releases/download/v" + new_version + "-" + new_sub + "/data.zip"

                download_file(download_url, directory + "download.zip")

                window.destroy()

            window = tk.Tk()

            window.title("BakaTCG")

            window.overrideredirect(True)

            window.geometry(
                f"190x80+{int((window.winfo_screenwidth() - 200) / 2)}+{int((window.winfo_screenheight() - 25) / 2)}")

            window.configure(bg="black")

            label = tk.Label(window, text="BakaTCG\n\nDownloading game files...\n\nThis might take a few minutes...",
                             fg="white", bg="black")
            label.pack()

            window.resizable(False, False)

            window.wm_attributes("-topmost", True)

            window.after(500, start_download)
            window.mainloop()

            extract()

            config = ConfigParser()
            config["Version"] = {"Sub-Version": new_sub, "Version": new_version}

            with open(directory + "info.ini", 'w') as configfile:  # save
                config.write(configfile)

            update_working = True  # PROBABLY WORKS IDK
    except ConnectionError:
        try:
            startfile(directory + "data/" + game_name)
            update_working = True

    return update_working


def update(download=False):
    update_working = False
    try:
        is_new_version, new_sub, new_version = check_version()

        download = download or is_new_version
        if not isdir(directory + "data"):
            download = True

        if download:
            download_url = "https://github.com/TotemPear/" + project_name + "/releases/download/v" + new_version + "-" + new_sub + "/data.zip"

            download_file(download_url, directory + "download.zip")

            config = ConfigParser()
            config["Version"] = {"Sub-Version": new_sub, "Version": new_version}

            with open(directory + "info.ini", 'w') as configfile:  # save
                config.write(configfile)

            update_working = True  # PROBABLY WORKS IDK
    except ConnectionError:
        try:
            startfile(directory + "data/" + game_name)
            exit()
            update_working = True

    return update_working
