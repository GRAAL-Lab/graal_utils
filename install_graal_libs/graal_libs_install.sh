sudo apt install -y libeigen3-dev
sudo apt install -y libgeographic-dev
sudo apt install -y libconfig++-dev

cd ~
mkdir graal_ws
cd graal_ws

git clone git@bitbucket.org:isme_robotics/rml.git
cd rml
mkdir build
cd build
cmake ..
sudo make install
cd ../..

git clone git@bitbucket.org:isme_robotics/fsm.git
cd fsm
mkdir build
cd build
cmake ..
sudo make install
cd ../..

git clone git@bitbucket.org:isme_robotics/ctrl_toolbox.git
cd ctrl_toolbox
mkdir build
cd build
cmake ..
sudo make install
cd ../..

git clone git@bitbucket.org:isme_robotics/tpik.git
cd tpik
mkdir build
cd build
cmake ..
sudo make install
cd ../..

git clone git@bitbucket.org:isme_robotics/ikcl.git
cd ikcl
mkdir build
cd build
cmake ..
sudo make install
cd ../..

git clone https://github.com/SINTEF-Geometry/SISL.git
cd SISL
mkdir build
cd build
cmake ..
sudo make install
cd ../..

git clone git@bitbucket.org:isme_robotics/sisl_toolbox.git
cd sisl_toolbox
mkdir build
cd build
cmake ..
sudo make install
cd ../..


