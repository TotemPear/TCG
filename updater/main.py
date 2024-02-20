import zipfile
from os import startfile, mkdir, remove
from getpass import getuser
from os.path import isfile, isdir
from psutil import process_iter
import update
from collections import Counter
from time import sleep

installer = False

game_name = "TCG.exe"

# Get all running process names
process_names = [p.name() for p in process_iter()]

# Count the number of instances of each program
process_counts = Counter(process_names)

# Get the counts for specific programs
updater_is_running = process_counts.get("tcg-updater.exe", 0) > 1
tcg_is_running = "BakaTCG.exe" in process_counts
installer_is_running = process_counts.get("TCG-Installer.exe", 0) > 1

print("Is tcg-updater.exe already running", updater_is_running)
print("Is TCG.exe running:", tcg_is_running)
print("Is TCG-Installer.exe already running:", installer_is_running)

will_download = False

directory = "C:/Users/" + getuser() + "/AppData/Local/BakaTCG/"

has_downloaded = False

extracted = False

game_started = False

if not isdir(directory):
    mkdir(directory)

is_working = tcg_is_running or installer_is_running


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
    else:
        while not is_working:


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
                        # is_working = True
                        sleep(3)
                    except FileNotFoundError:
                        will_download = True

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

            while any(p.name() == "TCG.exe" for p in process_iter()):
                update.update()

            if has_downloaded: extracted = update.extract()

            if game_started or extracted: exit()

