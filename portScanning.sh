#!/bin/bash

function ctrl_c(){
	echo -e "\n\n[!] Saliendo...\n"
	tput cnorm; exit 1
}

# Ctrl+C
# trap <function name> <signal name (interrupt/SIGINT)>
trap ctrl_c INT

tput civis

host=$1
for port in $(seq 1 65535); do
  timeout 1 bash -c "echo '' > /dev/tcp/$host/$port" &> /dev/null && echo "[+] Port $port is open" &
done; wait

tput cnorm
