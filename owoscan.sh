#!/bin/bash

#   ____   _____  _____   ____        _______      __      ____  _____ ____  _____ _________ _______    
# .'    \.|_   _||_   _|.'    \.     /  ___  |    /  \    |_   \|_   _|_   \|_   _|_   ___  |_   __ \   
#/  .--.  \ | | /\ | | /  .--.  \   |  (__ \_|   / /\ \     |   \ | |   |   \ | |   | |_  \_| | |__) |  
#| |    | | | |/  \| | | |    | |    '.___\-.   / ____ \    | |\ \| |   | |\ \| |   |  _|  _  |  __ /   
#\  \--'  / |   /\   | \  \--'  /   |\\____) |_/ /    \ \_ _| |_\   |_ _| |_\   |_ _| |___/ |_| |  \ \_ 
# \.____.'  |__/  \__|  \.____.'    |_______.'____|  |____|_____|\____|_____|\____|_________|____| |___|
        
#pwease no misuse only fow educational puwpose
#pwease donate I am a poow cybewsec student

echo "   ____   _____  _____   ____        _______      __      ____  _____ ____  _____ _________ _______    "
echo " .'    \.|_   _||_   _|.'    \.     /  ___  |    /  \    |_   \|_   _|_   \|_   _|_   ___  |_   __ \   "
echo " /  .--.  \ | | /\ | | /  .--.  \   |  (__ \_|   / /\ \     |   \ | |   |   \ | |   | |_  \_| | |__) |  "
echo " | |    | | | |/  \| | | |    | |    '.___\-.   / ____ \    | |\ \| |   | |\ \| |   |  _|  _  |  __ /   "
echo " \  \--'  / |   /\   | \  \--'  /   |\____) |_/ /    \ \_ _| |_\   |_ _| |_\   |_ _| |___/ |_| |  \ \_ "
echo "  \.____.'  |__/  \__|  \.____.'    |_______.'____|  |____|_____|\____|_____|\____|_________|____| |___|"


#function alarm it does shit i dont know how i made this im too afraid to touch it
alarm() {
    local timeout=$1; shift;
    bash -c "$@" &
    local pid=$!
    #sleep for the time seconds before tryna kill the process
    {
        sleep "$timeout"
        kill $pid 2> /dev/null
    } &
    wait $pid 2> /dev/null
    return $?
}

#function scanner actuall scans it lol
owoscan() {
    if [[ -z $1 || -z $2  ]]; then
        echo "UwU Usage is : owoscan <host> <port, ports, or port-range>"
        echo "OwO Example for yousies : owoscan rule-34.net"
        return
    fi

    local host=$1
    local ports=()
    #portsie wortsies go in array UwU
    case $2 in
            *-*)
            IFS=- read start end <<< "$2"
            for ((port=start; port <= end; port++)); do
                ports+=($port)
            done
            ;;
        *,*)
            IFS=, read -ra ports <<< "$2"
            ;;
        *)
            ports+=($2)
            ;;
    esac

    #attempts to write to the ports
    for port in "${ports[@]}"; do
        alarm 1 "echo >/dev/tcp/$host/$port" &&
            echo "OwO portsie wortsie number $port is tcp open" ||
            echo "UwU :( portsie number $port is tcp closed and avoiding us, must be a tsundere"   
    done
}