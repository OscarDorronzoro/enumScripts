#!/bin/bash

cat /proc/net/tcp | awk '{print $2}' | grep -v "local" | awk '{print $2}' FS=':' | while read port; do echo "obase=10; ibase=16; %port" | bc; done | sort -n
