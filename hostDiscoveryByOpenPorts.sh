#!/bin/bash

function ctrl_c(){
	echo -e "\n\n[!] Saliendo...\n"
	tput cnorm; exit 1
}

# Ctrl+C
# trap <function name> <signal name (interrupt/SIGINT)>
trap ctrl_c INT

tput civis

network=$1
for host in $(seq 1 254); do
  for port in 21 22 25 53 80 139 443 445 5985 8080; do
    timeout 1 bash -c "echo '' > /dev/tcp/$network.$host/$port" &> /dev/null && echo "[+] Host $network.$host ($port) is active" &
  done
done; wait

tput cnorm
