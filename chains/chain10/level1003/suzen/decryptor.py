from cryptography.fernet import Fernet
key = '81HqDtbqAywKSOumSha3BhWNOdQ26slT6K0YaZeZyPs='
input_file = 'flag.encrypted'
output_file = 'flag.txt'

with open(input_file, 'rb') as f:
    data = f.read()

fernet = Fernet(key)
encrypted = fernet.decrypt(data)

with open(output_file, 'wb') as f:
    f.write(encrypted)

with open('flag.txt', 'a') as the_file:
    the_file.write('\n')