import zipfile
from os import startfile, mkdir, remove
from getpass import getuser
from os.path import isfile, isdir
from psutil import process_iter
import update
from collections import Counter
from time import sleep
from ctypes import windll
from sys import exit
from pyshortcuts import make_shortcut

installer = False

game_name = "BakaTCG.exe"

# Get all running process names
process_names = [p.name() for p in process_iter()]

# Count the number of instances of each program
process_counts = Counter(process_names)

# Get the counts for specific programs
updater_is_running = process_counts.get("bakatcg-updater.exe", 0) > 2
installer_is_running = process_counts.get("BakaTCG-Installer.exe", 0) > 2

if installer_is_running:
    if installer:
        windll.user32.MessageBoxW(0, "The installer is already running.", 0)
    else:
        windll.user32.MessageBoxW(0, "The installer is currently running. Please wait for it to finish before opening the game.", "BakaTCG", 0)
    exit()


will_download = False

directory = "C:/Users/" + getuser() + "/AppData/Local/BakaTCG/"

has_downloaded = False

extracted = False

game_started = False

if not isdir(directory):
    mkdir(directory)

is_working = installer_is_running


if __name__ == "__main__":
    if installer:
        while not is_working:

            is_working = update.install(will_download)
            if not any(p.name() == "TCG.exe" for p in process_iter()):
                if isfile(directory + "download.zip"):
                    try:
                        update.extract()
                    except zipfile.BadZipfile:
                        remove(directory + "download.zip")

            if not isfile(directory + "data/data.win") or not isfile(directory + "data/options.ini"):
                will_download = True
            else:
                try:
                    startfile(directory + "data/" + game_name)
                    is_working = True
                except FileNotFoundError:
                    will_download = True



            make_shortcut(directory + "bakatcg-updater.exe", name="BakaTCG", icon=directory + "data/" + game_name)
    else:
        while True:

            if not any(p.name() == "TCG.exe" for p in process_iter()):
                if isfile(directory + "download.zip"):
                    try:
                        update.extract()
                    except zipfile.BadZipfile:
                        remove(directory + "download.zip")
                if not isdir(directory + "data/"):
                    will_download = True
                elif not isfile(directory + "data/data.win") or not isfile(directory + "data/options.ini"):
                    will_download = True
                elif not game_started:
                    try:
                        startfile(directory + "data/" + game_name)
                        game_started = True
                        if updater_is_running: exit()
                        # is_working = True
                        sleep(3)
                    except FileNotFoundError:
                        will_download = True

            if updater_is_running: exit()

            has_downloaded = update.update(will_download)

            # if isfile(directory + "download.zip"):
            #     try:
            #         update.extract()
            #     except zipfile.BadZipfile:
            #         remove(directory + "download.zip")
            # if not isdir(directory + "data/"):
            #     will_download = True
            # elif not isfile(directory + "data/data.win") or not isfile(directory + "data/options.ini"):
            #     will_download = True
            # elif not game_started:
            #     try:
            #         startfile(directory + "data/" + game_name)
            #         game_started = True
            #         # is_working = True
            #         sleep(3)
            #     except FileNotFoundError:
            #         will_download = True

            while any(p.name() == game_name for p in process_iter()):
                update.update()

            if has_downloaded: extracted = update.extract()

            if game_started or extracted: exit()
