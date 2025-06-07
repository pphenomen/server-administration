#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 planet_name"
    exit 1
fi

planet=$1
moons=0

case $planet in
    Mercury)
        moons=0
        ;;
    Venus)
        moons=0
        ;;
    Earth)
        moons=1
        ;;
    Mars)
        moons=2
        ;;
    Jupiter)
        moons=98
        ;;
    Saturn)
        moons=83
        ;;
    Uranus)
        moons=27
        ;;
    Neptune)
        moons=14
        ;;
    Pluto)
        moons=5
        ;;
    *)
        echo "Unknown planet"
	exit 1
        ;;
esac

echo $moons
