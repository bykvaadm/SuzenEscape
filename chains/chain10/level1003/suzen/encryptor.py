from cryptography.fernet import Fernet
key = '81HqDtbqAywKSOumSha3BhWNOdQ26slT6K0YaZeZyPs='
input_file = 'flag.txt'
output_file = 'flag.encrypted'

with open(input_file, 'rb') as f:
    data = f.read()

fernet = Fernet(key)
encrypted = fernet.encrypt(data)

with open(output_file, 'wb') as f:
    f.write(encrypted)
