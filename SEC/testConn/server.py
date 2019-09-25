#!/usr/bin/python

import socket

HOST = 'localhost'
BIND_PORT = 1337

def tcp_server():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind((HOST, PORT))
    s.listen(1)
    conn, addr = s.accept()

    print 'connected by', addr
    
    while 1:
        data=conn.recv(1024)
        if not data: break
        conn.send(data)
    conn.close()

if __name__ == '__main__':
    tcp_server()
