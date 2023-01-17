import daisy_class
# instanciate the class object
instance = daisy_class.Daisy()
# get the command from the user
command = instance.take_command()
command = command.lower()

# create a dictionary of cases where the keys are the command strings and the values are the functions to be executed
case = {
        'play': instance.play_media(command.replace('play', '')),
        'text john': instance.send_whatsapp_message("+1 (000) 6150000"),
        'picture john': instance.send_whatsapp_image("+1(614)0000000", "Images/cute_cat.jpg"),
        }