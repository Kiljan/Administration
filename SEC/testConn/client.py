import socket

HOST = '127.0.0.1'
PORT = 9090
DATA = 'tajne dane urzytkownikow hehe'


def tcp_client():
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect((HOST, PORT))
    client.send(DATA)
    response = client.recv(4096)
    print response


if __name__ == '__main__':
    tcp_client()
