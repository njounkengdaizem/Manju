import os

import speech_recognition as speech
import pyttsx3
import pywhatkit
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


def send_whatsappmessage(phone_number):
    pywhatkit.sendwhatmsg_instantly(phone_number, "How are you doing?")

def send_message(phone_number):
    os.system("open -a Messages")
    keyboard = Controller()
    keyboard.type("Hi, How are you doing?")
    keyboard.press(Key.enter)



def run_daisy():
    command = take_command()
    print(command)
    if 'play' in command:
        song = command.replace('play', '')
        talk('playing ' + song)
        pywhatkit.playonyt(song)
    elif 'text' and 'baby' in command:
        send_whatsappmessage("+1(787)2427974")
    elif 'text' and 'big head' in command:
        send_whatsappmessage("+1(614)6153553")
    elif 'message' and 'baby' in command:
        send_whatsappmessage("+1(787)2427974")
    elif 'message' and 'big head' in command:
        send_whatsappmessage("+1(614)6153553")
    elif 'time' in command:
        time = datetime.datetime.now().strftime('%I:%M %p')
        talk('Current time is ' + time)

    elif 'who the heck is' in command:
        person = command.replace('who the heck is', '')
        info = wikipedia.summary(person, 1)
        print(info)
        talk(info)
    elif 'date' in command:
        talk('sorry, I have a headache')
    elif 'name' in command:
        talk('People call me Daisy. But my real name is Harley Quinn.'
             ' I have been an undercover all this while. I am the meanest '
             'person you will ever meet. Never take an advice from me')
    elif 'are you single' in command:
        talk('I am in a relationship with wifi')
    elif 'joke' in command:
        talk(pyjokes.get_joke())
    else:
        talk('I did not hear you, now repeat what you just said in English hahaha')


while True:
    run_daisy()
