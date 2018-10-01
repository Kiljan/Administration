import socket

HOST = '127.0.0.1'
PORT = 9090
DATA = 'tajne dane urzytkownikow hehe'


def tcp_client():
    client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    client.sendto(DATA, (HOST, PORT))
    data, addr = client.recvfrom(4096)
    print data, addr


if __name__ == '__main__':
    tcp_client()
