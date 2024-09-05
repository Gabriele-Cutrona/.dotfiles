from os import system as sys
import subprocess

name = subprocess.run(". /etc/os-release; echo $NAME", shell=True, capture_output=True, text=True)
if name.stdout.strip() == "Fedora Linux":
    sys("cp ~/.dotfiles/.shtart/fedora.txt ~/logo.txt")
elif name.stdout.strip() == "Arch Linux":
    sys("cp ~/.dotfiles/.shtart/arch.txt ~/logo.txt")
elif name.stdout.strip() == "Alpine Linux":
    sys("cp ~/.dotfiles/.shtart/alpine.txt ~/logo.txt")
else:
    sys("touch ~/logo.txt")
