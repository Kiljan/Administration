import socket

HOST = '127.0.0.1'
PORT = 1337
DATA = 'tajne dane urzytkownikow hehe'


def tcp_client():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((HOST, PORT))
    s.send('Hello world')
    data = s.recv(1024)
    s.close()
    print 'Recived', repr(data)

if __name__ == '__main__':
    tcp_client()
