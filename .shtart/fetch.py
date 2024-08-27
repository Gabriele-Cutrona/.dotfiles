from os import system as sys
import subprocess

command = "toilet -f future -F border --metal -w $(( $(tput cols) - 2 ))"

pacman = subprocess.run("pacman -Q | wc -l", shell=True, capture_output=True, text=True)
flatpak = subprocess.run("flatpak list | wc -l", shell=True, capture_output=True, text=True)
dnf = subprocess.run("dnf list installed | wc -l", shell=True, capture_output=True, text=True)
if int(pacman.stdout.strip()) != 0:
    command = command + " \"$(pacman -Q | wc -l) (pacman)\""
if int(flatpak.stdout.strip()) != 0:
    command = command + " \"$(flatpak list | wc -l) (flatpak)\""
if int(dnf.stdout.strip()) != 0:
    command = command + " \"$(dnf list installed | wc -l) (dnf)\""

sys(command)
