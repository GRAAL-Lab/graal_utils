#!/bin/bash
GRN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# Generic libraries needed for math, geographic and configuration operations
sudo apt install -y libeigen3-dev libgeographic-dev libconfig++-dev libboost-all-dev

# Libraries needed for vehicles GPS drivers
sudo apt install -y libgps-dev gpsd-clients

# Libraries needed for Graal GUIs
sudo apt install -y qtquickcontrols2-5-dev qtlocation5-dev qtpositioning5-dev qml-module-qtquick-controls2 qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel qml-module-qtlocation qml-module-qtpositioning qml-module-qtquick-extras qml-module-qtgraphicaleffects qml-module-qtquick-dialogs qml-module-qtquick-controls python3-colcon-common-extensions qml-module-qtqml-models2

# Do I need to say anything?
sudo apt install -y cmake git

# Create "graal_ws" folder
cd ~
if ! [ -d graal_ws ]; then
    mkdir graal_ws
fi
cd graal_ws

git clone https://github.com/SINTEF-Geometry/SISL.git
cd SISL
if [ "${PWD##*/}" = "SISL" ]; then
    if ! [ -d build ]; then
        mkdir build
    fi
    
    cd build
    cmake ..
    sudo make install
    cd ../..
else
    echo -e "${RED}Error cloning \'SISL\' repository!${NC}"
fi

## All the GRAAL repository to install in DEPENDENCY ORDER:
# - RML: Robotics Mathematical Library
# - FSM: Finite state machine library.
# - CTB: Control Toolbox (VirtualFrames, PID, Kalman Filter)
# - TPIK: Task Priority Inverse Kinematic Library (basic tools for TP)
# - IKCL: Inverse Kinematic Control Library (set of TP tasks)
# - SISL Toolbox: Curve generation library
declare -a arr=("rml" "fsm" "ctrl_toolbox" "tpik" "ikcl" "sisl_toolbox")

## now loop through the above array
for i in "${arr[@]}"
do
    if ! [ -d $i ]; then
        echo -e "${GRN}Installing $i... ${NC}"
        git clone git@bitbucket.org:isme_robotics/$i.git
        cd $i
    else
        echo -e "${GRN}Updating $i... ${NC}"
        cd $i
        git pull
    fi
    
    if [ "${PWD##*/}" = "$i" ]; then
        if ! [ -d build ]; then
            mkdir build
        fi
        
        cd build
        cmake ..
        sudo make install
        cd ../..
    else
        echo -e "${RED}Error cloning \'${i}\' repository!${NC}"
    fi
done


cd ~
