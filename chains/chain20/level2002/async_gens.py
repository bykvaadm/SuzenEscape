import socket  # We import it for work with sockets
from select import select

tasks = []# it is better to implement with using the queue (need to google)

to_read = {}
to_write = {}  # Hmmm why am I doing this ????


def server():
    server_socket = socket.socket(
        socket.AF_INET, socket.SOCK_STREAM)  # Install
    server_socket.setsockopt(
        socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)  # connection
    server_socket.bind(('127.0.0.1', 5000))  # via socket
    server_socket.listen()
    while True:  # And this is an endless cycle
        yield ('read', server_socket)
        client_socket, addr = server_socket.accept()
        print('Connection from #', addr)
        tasks.append(client(client_socket))# We replenish the list of tasks


def client(client_socket):
    while True:             # And here he is again (while the truth)
        yield ('read', client_socket)
        request = client_socket.recv(4096)
        if request:  # If I received something from the user
            response = '#Hello #friend\n'.encode()
            yield ('write', client_socket)
            client_socket.send(response)
        else:  # Otherwise, we finish listening
            break
    print('Connection close')
    client_socket.close()  # Close connection.


def event_loop():  # Event loop
    while any([tasks, to_read, to_write]):
        while not tasks:  # If the task list is empty, we fill it!
            ready_to_read, ready_to_write, _ = select(to_read, to_write, [])
            for sock in ready_to_read:
                tasks.append(to_read.pop(sock))
            for sock in ready_to_write:
                tasks.append(to_write.pop(sock))
        try:
            task = tasks.pop(0)  # Do some tasks work
            reason, sock = next(task)
            if reason == 'read':# If it is not for reading
                to_read[sock] = task  # add to reading list
            elif reason == 'write':                   # If it is for recording
                to_write[sock] = task# Add to reading list
        except StopIteration:
            print('Done! #we did #it')


if __name__ == '__main__':       # If the file was launched directly, then blah blah blah ...
    tasks.append(server())
    event_loop()  # Call func event_loop
