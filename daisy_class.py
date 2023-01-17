import os
import sys
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

class Daisy():

    def __init__(self) -> None:
        self.listener = speech.Recognizer()
        self.engine = pyttsx3.init()
        self.voices = self.engine.getProperty('voices')
        for voice in self.voices:
            self.engine.setProperty('voice', voice.id)
            self.engine.setProperty('voice', self.voices[1].id)


    def talk(self,text):
        self.engine.say(text) 
        self.engine.runAndWait()


    def take_command(self):
        try:
            with speech.Microphone() as source:
                print('listening...')
                voice = self.listener.listen(source)
                command = self.listener.recognize_google(voice)
                command = command.lower()
                if 'daisy' in command:
                    # talk(command)
                    command = command.replace('daisy', '')
                    print(command)
        except speech.UnknownValueError as e:
            print("Could not understand audio")
            command = ""
        except speech.RequestError as e:
            print("Could not request from Google Speech Recognition service; {0}".format(e))
            command = ""
        return command


    def send_whatsapp_message(self, name:str):
    
        for i in name:
            print (i)
            print("\n.")
        if "john" in name:
            pywhatkit.sendwhatmsg_instantly("+1(000)000-0000", "Howdy, como estas?")

    def send_whatsapp_image(phone_number, image):
        pywhatkit.sendwhats_image(phone_number, image)

    def play_media(self, media):
        self.talk('playing ' + media)
        pywhatkit.playonyt(media)

    def current_time(self):
        time = datetime.datetime.now().strftime('%I:%M %p')
        self.talk('Current time is ' + time)

    def send_message(phone_number):
        os.system("open -a Messages")
        keyboard = Controller()
        keyboard.type("Hi beautiful, how are you doing?")
        keyboard.press(Key.enter)
