import daisy_class

instance = daisy_class.Daisy()

command = instance.take_command()
command = command.lower()
case = {
        'play': instance.play_media(command.replace('play', '')),
        'text john': instance.send_whatsapp_message("+1 (000) 6150000"),
        'picture john': instance.send_whatsapp_image("+1(614)0000000", "Images/cute_cat.jpg"),
        }