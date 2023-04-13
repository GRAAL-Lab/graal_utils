cd ~/graal_ws 

# Update all repos
find . -maxdepth 1 -type d -exec sh -c '(cd {} && git pull)' ';'

# Compile and install
find . -maxdepth 1 -type d -exec sh -c '(cd {}/build && sudo make install)' ';'
