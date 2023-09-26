#!/bin/python3

import socket
from os import environ

# socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle $line; done

server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM, 0)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

hypr_instance_signature = environ["HYPRLAND_INSTANCE_SIGNATURE"]
socket_file_name = f"/tmp/hypr/{hypr_instance_signature}/.socket2.sock"

server.bind(socket_file_name)

while True:
    server.listen(1)
    conn, addr = server.accept()

    data = conn.recv(1024)
    if data:
        print(data)
