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
for h in $(seq 1 254); do
	timeout 1 bash -c "ping -c1 $network.$h" &> /dev/null && echo "[+] Host $network.$h is active" &
done; wait

tput cnorm

