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
