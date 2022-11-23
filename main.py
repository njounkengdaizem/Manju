import os

import speech_recognition as speech
import pyttsx3
import pywhatkit
from datetime import date
import time
import pynput
from pynput import keyboard
from pynput.keyboard import Key, Controller
import datetime
import wikipedia
import pyjokes

listener = speech.Recognizer()
engine = pyttsx3.init()
voices = engine.getProperty('voices')
for voice in voices:
    engine.setProperty('voice', voice.id)
engine.setProperty('voice', voices[1].id)


def talk(text):
    engine.say(text)
    engine.runAndWait()


def take_command():
    try:
        with speech.Microphone() as source:
            print('listening...')
            voice = listener.listen(source)
            command = listener.recognize_google(voice)
            command = command.lower()
            if 'daisy' in command:
                talk(command)
                command = command.replace('daisy', '')
                print(command)
    except:
        pass
    return command


def send_whatsapp_message(phone_number):
    pywhatkit.sendwhatmsg_instantly(phone_number, "How are you doing?")

def send_whatsapp_image(phone_number, image):
    pywhatkit.sendwhats_image(phone_number, image)


def send_message(phone_number):
    os.system("open -a Messages")
    keyboard = Controller()
    keyboard.type("Hi, How are you doing?")
    keyboard.press(Key.enter)


def run_daisy():
    command = take_command()

    # Play Song
    if 'play' in command:
        song = command.replace('play', '')
        talk('playing ' + song)
        pywhatkit.playonyt(song)

    # Send a whatsapp message
    elif 'text' and 'john' in command:
        send_whatsapp_message("+1 (614) 615-3553")
    elif 'text' and 'micky' in command:
        send_whatsapp_message("+1(859)0000000")

    # Send a picture on whatsapp
    elif 'picture' and 'john' in command:
        pywhatkit.sendwhats_image("+1(614)6153553", "Images/cute_cat.jpg")

    # Send an SMS
    elif 'message' and 'john' in command:
        send_whatsapp_message("+1(787)0000000")
    elif 'message' and 'micky' in command:
        send_whatsapp_message("+1(614)0000000")

    # Tell the time
    elif 'time' in command:
        time = datetime.datetime.now().strftime('%I:%M %p')
        talk('Current time is ' + time)

     # Tell the date
    elif 'date' in command:
        today = date.today().strftime('%B %d, %Y')
        talk("Today is " + today)

    # Find someone on wikipedia
    elif 'who is' in command:
        person = command.replace('who is', '')
        info = wikipedia.summary(person, 1)
        print(info)
        talk(info)

    # Random/funny commands
    elif 'name' in command:
        talk('My name is Daisy the great.')
    elif 'are you single' in command:
        talk('Dating is overrated')
    elif 'joke' in command:
        talk(pyjokes.get_joke())

    # Case where audio isn't audible
    else:
        talk("Sorry I didn't understand. Please repeat")


while True:
    run_daisy()
