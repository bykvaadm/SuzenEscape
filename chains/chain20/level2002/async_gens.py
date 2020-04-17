import socket  # Импортируем для работы с сокетами
from select import select

tasks = []  # лучше реализовывать при помощи очереди (погуглить)

to_read = {}
to_write = {}  # Хмммм зачем я этим занимаются????


def server():
    server_socket = socket.socket(
        socket.AF_INET, socket.SOCK_STREAM)  # Устанавливаем
    server_socket.setsockopt(
        socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)  # соединения
    server_socket.bind(('127.0.0.1', 5000))  # при помощи socket
    server_socket.listen()
    while True:  # А это бесконечный цикл
        yield ('read', server_socket)
        client_socket, addr = server_socket.accept()
        print('Connection from', addr)
        tasks.append(client(client_socket))  # Пополняем список заданий


def client(client_socket):
    while True:  # И тут опять он (пока истина)
        yield ('read', client_socket)
        request = client_socket.recv(4096)
        if request:  # Если я получил что-то от пользователя
            response = 'Hello friend\n'.encode()
            yield ('write', client_socket)
            client_socket.send(response)
        else:  # Иначе завершаем слушать
            break
    print('Connection close')
    client_socket.close()  # закрываем соединение


def event_loop():  # Событийный цикл
    while any([tasks, to_read, to_write]):
        while not tasks:  # Если список заданий пуст мы заполняем его
            ready_to_read, ready_to_write, _ = select(to_read, to_write, [])
            for sock in ready_to_read:
                tasks.append(to_read.pop(sock))
            for sock in ready_to_write:
                tasks.append(to_write.pop(sock))
        try:
            task = tasks.pop(0)  # Выполняем тут задания
            reason, sock = next(task)
            if reason == 'read':  # Если оно для чтения
                to_read[sock] = task  # добавляем в список для чтения
            elif reason == 'write':  # Если оно для записи
                to_write[sock] = task  # добавляем в список для чтения
        except StopIteration:
            print('Done!')


if __name__ == '__main__':  # Если файл непосредственно запустили бла бла бла
    tasks.append(server())
    event_loop()  # Вызываем функцию event_loop
