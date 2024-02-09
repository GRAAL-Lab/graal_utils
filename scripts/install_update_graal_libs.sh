# Libraries needed for the ctrl_toolbox
sudo apt install -y libeigen3-dev libgeographic-dev libconfig++-dev

# Libraries needed for vehicles GPS drivers
sudo apt install -y libgps-dev gpsd-clients

# Libraries needed for Graal GUIs
sudo apt install -y qtquickcontrols2-5-dev qtlocation5-dev qtpositioning5-dev qml-module-qtquick-controls2 qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel qml-module-qtlocation qml-module-qtpositioning qml-module-qtquick-extras qml-module-qtgraphicaleffects qml-module-qtquick-dialogs qml-module-qtquick-controls python3-colcon-common-extensions qml-module-qtqml-models2

sudo apt install -y git

# Create "graal_ws" folder
cd ~
if ! [ -d graal_ws ]; then
    mkdir graal_ws
fi
cd graal_ws

if ! [ -d SISL ]; then
    echo "Installing $i"
    git clone https://github.com/SINTEF-Geometry/SISL.git
    cd SISL
else
    echo "Updating $i"
    cd SISL
    git pull
fi

if ! [ -d build ]; then
    mkdir build
fi

cd build
cmake ..
sudo make install
cd ../..


## All the GRAAL repository to install in DEPENDENCY ORDER
declare -a arr=("rml" "fsm" "ctrl_toolbox" "tpik" "ikcl" "sisl_toolbox")

## now loop through the above array
for i in "${arr[@]}"
do
    if ! [ -d $i ]; then
        echo "Installing $i"
        git clone git@bitbucket.org:isme_robotics/$i.git
        cd $i
    else
        echo "Updating $i"
        cd $i
        #git pull
    fi
    
    if ! [ -d build ]; then
        mkdir build
    fi
    
    cd build
    cmake ..
    sudo make install
    cd ../..
done
