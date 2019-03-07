# QtCreator and ROS2 Setup Guide

On Ubuntu 18.04+ you can simply install QtCreator from the official pre-compiled binaries:

```
#!bash
sudo apt install qtcreator
```
    
Then, to make it work with ROS2 you can simply run in from ROS2 sourced bash.
Instead, if you'd like to integrate the .desktop launcher with ROS2 open a terminal and type:


```
#!bash
locate .desktop | grep qtcreator
```
   
And for every .desktop launcher found (e.g. *DigiaQt-qtcreator-community.desktop*), in the **Exec=** property, use:

```
#!bash
Exec=bash -i -c "sourceros2 && qtcreator"
```

## Additional QtCreator customization

### Plugins

To enable **tabs** in the editor, copy the *libTabbedEditor.so* file in the `/usr/lib/x86_64-linux-gnu/qtcreator/plugins/` folder.

To enable the **automatic formatting** and **code suggestion**:

1. Download clang-format using: `sudo apt install clang-format`

2. Open QtCreator and go to *"Help->About Plugins..."* and enable:

    - [x] Beautifier
    - [x] ClangCodeModel

3. Go to *"Tools->Options...->Beautifier->Clang Format"* and select **WebKit** as the predefined style.


### Theme

To use the Monokai-RainbowDrops theme, copy the *monokai-brfg_2.xml* file in the `~/.config/QtProject/qtcreator/styles` folder.
Then go to *"Text Editor->Font and Colors->Color Scheme"* and select it from the drop-down menu.


