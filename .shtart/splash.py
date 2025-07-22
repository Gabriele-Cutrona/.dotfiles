# Hey You! Yes, you. I know you're probably thinking that I'm an idiot and there are a hundred better ways to do this
# But 1. I'm lazy 2. I don't know python 3. :3
# Update: actually maybe let's fix this (don't get me wrong, I still don't know python, but...)

from random import randint
from os import system as sys

stuff = [
	"こんにちは！",
	"Hiii! :3",
	"The cake Is A Lie!",
	"UwU :3",
	"Better Call Saul!",
	"A Smile Is a Valuable Tool My Dear",
	"This Face Was Made For RADIO",
	"Custom splashes 'cause Hyprland doesn't let me!",
	"It's not a bug, it's a feature", # Better Call Saul 1x04 9:05
	"Afterall, the world is a stage",
	"and the stage is a world of entertainment!",
	"Workers of the world, unite!"
]

sentence = stuff[randint(0, len(stuff) - 1)]

sys(f'toilet -f mono9 "{sentence}" --gay -w $(tput cols)')
