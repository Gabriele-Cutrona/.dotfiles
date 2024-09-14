from random import randint
from os import system as sys

num = randint(1, 8)
if num == 1:
   sentence = "こんにちは！" # Because yes
elif num == 2:
   sentence = "The Cake Is A Lie!" # I didn't even finish portal 2 lol
elif num == 3:
   sentence = "UwU :3" # Because yes
elif num == 4:
   sentence = "Better Call Saul!" # Because yes
elif num == 5:
   sentence = "A Smile Is a Valuable Tool My Dear" # Alastor
elif num == 6:
   sentence = "This Face Was Made For RADIO" # Alastor (*has a mental breakdown*)
elif num == 7:
   sentence = "Making custom terminal splashes because Hyprland doesn't let me!"
elif num == 8:
   sentence = "It's not a bug, it's a feature"

color = "gay"

sys(f"toilet -f mono9 \"{sentence}\" --{color} -w $(tput cols)")
