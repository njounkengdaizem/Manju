# ConversationalAI_daisy

Inspiration from Amazon Alexa's conversational AI
These initial developments are out of personal interests. 
I do plan to eventually add more functionality

## Getting Started

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on deploying the project on a live system.

### Prerequisites

Requirements for the software and other tools to build, test and push 
- [speechRecognition](https://pypi.org/project/SpeechRecognition/)
- [Text to Speech](https://pypi.org/project/pyttsx3/)
- [Wikipedia data](https://pypi.org/project/wikipedia/)
- [Browser navigation](https://pypi.org/project/pywhatkit/)
- [pyjokes](https://pypi.org/project/pyjokes/)

### Methods

```__init__(self) -> None```: The constructor method that initializes the listener, engine, and voices properties when an instance of the class is created.

```talk(self,text)```: This method takes a single argument, a text string, and uses the pyttsx3 library to speak the text.

```take_command(self)```: This method listens to the microphone and uses the Google Speech Recognition service to recognize the audio. If the audio is not understood, it returns an empty string.

```send_whatsapp_message(self, name:str)```: This method takes a single argument, a name, and uses the pywhatkit library to send a WhatsApp message to the number associated with the given name.

```send_whatsapp_image(phone_number, image)```: This method takes two arguments, phone number and image and uses the pywhatkit library to send a WhatsApp image to the given phone number.

```play_media(self, media)```: This method takes a single argument, media and uses the pywhatkit library to play the media on youtube.

```current_time(self)```: This method tells the current time using datetime library.

```send_message(phone_number)```: This method takes phone number as an argument and uses os and pynput library to open message application and send message to the given phone number.

### Installing

A step by step series of examples that tell you how to get a development
environment running

Say what the step will be

    Give the example

And repeat

    until finished

End with an example of getting some data out of the system or using it
for a little demo

## Running the tests

TODO

### Sample Tests

TODO

    Give an example

### Style test

TODO

## Deployment

TODO

## Acknowledgments

  - Programming Hero
  - Inspiration
  - etc
