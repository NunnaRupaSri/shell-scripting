#!/usr/bin/env bash

# OUTPUT REDIRECTOR

#1. ls >/tmp/out
#2. ls >/dev/null
#3. ls >>/tmp/out
#4. ls | tee /tmp/out  (overwrite previous content)
#5. ls | tee -a /tmp/out (append to previous content)
#6. ls -d /root /root1 >/tmp/out 2>/tmp/err
#7. ls -ld /root /root1 &>/tmp/out
#8. ls -ld /root /root1 &>/dev/null

#INPUT REDIRECTOR
# grep root </etc/passwd
#