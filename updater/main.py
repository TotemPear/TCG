import zipfile
from os import startfile, mkdir, remove
from getpass import getuser
from os.path import isfile, isdir
from psutil import process_iter
import update

tcg_is_running = "TCG.exe" in (p.name() for p in process_iter())
installer_is_running = "TCG-Installer.exe" in (p.name() for p in process_iter())

will_download = False

directory = "C:/Users/" + getuser() + "/AppData/Local/TCG/"

if not isdir(directory):
    mkdir(directory)

is_working = tcg_is_running or installer_is_running

if __name__ == "__main__":
    while not is_working:
        if isfile(directory + "download.zip"):
            try:
                update.extract()
            except zipfile.BadZipfile:
                remove(directory + "download.zip")

        is_working = update.update(will_download)

        if not isfile(directory + "data/data.win") or not isfile(directory + "data/options.ini"):
            will_download = True
        else:
            try:
                startfile(directory + "data/TCG.exe")
                is_working = True
            except FileNotFoundError:
                will_download = True
