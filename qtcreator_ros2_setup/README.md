# QtCreator and ROS2 Setup Guide

## Installing 

On Ubuntu 18.04+ you can simply install QtCreator from the official pre-compiled binaries:

```
#!bash
sudo apt install qtcreator
```
    
Then, to make it work with ROS2 you can simply run it from a ROS2 sourced bash.
Otherwise, if you'd like to integrate the .desktop launcher with ROS2, open a terminal and type:


```
#!bash
locate .desktop | grep qtcreator
```
   
And for every .desktop launcher found (e.g. *DigiaQt-qtcreator-community.desktop*), in the **Exec=** property, use:

```
#!bash
Exec=bash -i -c "sourceros2 && qtcreator"
```

where `sourceros2` is an alias you have created in your **~/.bashrc**, e.g.:

```
#!bash
alias sourceros2='source /opt/ros/crystal/setup.bash && source ~/ros2_ws/install/setup.bash'
```

## Importing packages

Differently from ROS1, you cannot import whole ROS2 workspaces, instead you need to import each package separately. To import a package in QtCreator:

1. Go to *"File->Open File or Project..."* and select the package **CMakeLists.txt**.

2. In the "Configure Project" step, deselect all the build configurations and leave only the **Debug** one. Be careful to change the build folder to something different, which by default builds in the `src` folder (messing up the workspace).

*NOTE*: The variables highlighting will start working after you build the package once.

## Additional QtCreator customization

### Plugins

To enable **tabs** in the editor, copy the *libTabbedEditor.so* file (precompiled for QtCreator 4.5.2 on a 64-bit Linux) in the `/usr/lib/x86_64-linux-gnu/qtcreator/plugins` folder.

To enable the **automatic formatting** and **clang warnings**:

1. Download clang-format using: `sudo apt install clang-format`

2. Open QtCreator and go to *"Help->About Plugins..."* and enable:

    - [x] Beautifier
    - [x] ClangCodeModel

3. Go to *"Tools->Options...->Beautifier->Clang Format"* and select **WebKit** as the predefined style.

4. To create a formatting keyboard shortcut go to *"Tools->Options...->Environment->Keyboard"*, look for the *Format Current File* command under **ClangFormat** and assign a new shortcut, e.g. `Ctrl+Alt+K`.

### Theme

To use the Monokai-RainbowDrops theme, copy the *monokai-brfg_2.xml* file in the `~/.config/QtProject/qtcreator/styles` folder.
Then go to *"Text Editor->Font and Colors->Color Scheme"* and select it from the drop-down menu.


