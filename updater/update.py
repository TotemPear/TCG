from requests import get, ConnectionError
from json import loads
from configparser import ConfigParser
from shutil import rmtree
from tqdm import tqdm
from zipfile import ZipFile
from os import remove, startfile, mkdir
from os.path import isfile, isdir
from getpass import getuser
import tkinter as tk
import threading
from time import sleep

directory = "C:/Users/" + getuser() + "/AppData/Local/TCG/"

currently_downloading = True


def download_file(url, destination):
    # Send a GET request to the URL
    response = get(url, stream=True)

    # Get the total file size in bytes
    total_size = int(response.headers.get('content-length', 0))

    # Initialize a tqdm progress bar with the total file size
    progress_bar = tqdm(total=total_size, unit='B', unit_scale=True)

    # Check if the request was successful (status code 200)
    if response.status_code == 200:
        # Open the destination file in binary write mode
        with open(destination, 'wb') as f:
            # Iterate over the content of the response in chunks
            for chunk in response.iter_content(chunk_size=1024):
                # Write the chunk to the file
                f.write(chunk)
                # Update the progress bar with the size of the chunk
                progress_bar.update(len(chunk))
        # Close the progress bar
        progress_bar.close()
        # print("Download successful.")
    else:
        download_file(url, destination)


def extract():
    print("Extracting files...")

    if isdir(directory + "data"):
        rmtree(directory + "data")

    mkdir(directory + "data")

    # Open your .zip file
    with ZipFile(file=directory + "download.zip") as zip_file:
        # Loop over each file
        for file in tqdm(iterable=zip_file.namelist(), total=len(zip_file.namelist())):
            # Extract each file to another directory
            # If you want to extract to current working directory, don't specify path
            zip_file.extract(member=file, path=directory + "data/")

    remove(directory + "download.zip")


def update(_download):
    update_working = False
    download = _download
    try:
        new_version = loads(get("https://baka-tcg-default-rtdb.firebaseio.com/system/.json").text)

        new_sub = new_version["sub-version"]
        new_version = new_version["version"]

        # print("C:/Users/"+getuser()+"/AppData/Local/TCG")

        sub = "alpha"
        version = "0"

        if isfile(directory + "info.ini"):
            config = ConfigParser()
            config.read(directory + "info.ini")
            try:
                sub = config["Version"]["Sub-Version"]
                version = config["Version"]["Version"]
            except KeyError:
                download = True

            if sub != new_sub:
                if sub == "alpha":
                    if new_sub == "beta" or new_sub == "":
                        download = True
                elif sub == "beta" and new_sub == "":
                    download = True
        else:
            download = True

        if not download:
            new_array = new_version.split(".")
            old_array = version.split(".")

            while len(new_array) > len(old_array):
                old_array.append("0")
            while len(old_array) > len(new_array):
                new_array.append("0")

            for i in range(len(new_array)):
                if int(new_array[i]) > int(old_array[i]):
                    download = True
                    break
                elif int(old_array[i]) > int(new_array[i]):
                    break

        if not isdir(directory + "data"):
            download = True

        if download:
            def start_download():
                print("Starting download...")
                download_url = "https://github.com/TotemPear/TCG/releases/download/v" + new_version + "-" + new_sub + "/data.zip"

                download_file(download_url, directory + "download.zip")

                window.destroy()

            window = tk.Tk()

            window.title("TCG")

            window.overrideredirect(True)

            window.geometry(f"200x25+{int((window.winfo_screenwidth()-200)/2)}+{int((window.winfo_screenheight()-25)/2)}")

            window.configure(bg="black")

            label = tk.Label(window, text="Downloading game files.", fg="white", bg="black")
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
    except ConnectionError:
        print("A problem occurred while trying to fetch update information.")
        try:
            startfile(directory + "data/TCG.exe")
            update_working = True
        except FileNotFoundError:
            print("An error occurred.")

    return update_working



