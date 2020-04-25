# Visual Studio Code installation guide for XTool wrapper


## Installation
Create the directory for Visual Studio Code versions:
```sh
$ mkdir ${HOME}/opt/vscode
$ cd ${HOME}/opt/vscode
```

Download one of the releases of [Visual Studio Code](https://code.visualstudio.com/download) and extract it:
```sh
$ wget https://go.microsoft.com/fwlink/?LinkID=320381 -O vscode-1.42.tar.gz
$ tar xfz vscode-1.42.tar.gz
```

Rename the extracted `VSCode-linux-x64` directory as `1.42` and create a
`default` symbolic link:
```sh
$ mv VSCode-linux-x64 1.42
$ ln -s 1.42 default
```

Create the `xtool` wrapper in `bin`:
```sh
$ mkdir bin
$ cd bin
$ cat <<EOF > xtool
#!/bin/bash

# Configure tool variables
XTOOL_NAME=vscode
XTOOL_VERSION_VAR=VSCODE_VERSION
XTOOL_BINDIRS=bin
XTOOL_LIBDIRS=

# Include the main code from the xtool
source ${HOME}/opt/bin/xtool-main

# Launch the tool using the exec code from the xtool
source ${HOME}/opt/bin/xtool-exec
EOF
$ chmod +x xtool
```

Link the `xtool` wrapper with the name of the binaries (code):
```sh
$ ln -s xtool code
```

Link the binaries in the top directory `${HOME}/opt/bin`:
```sh
$ cd ${HOME}/opt/bin
$ ln -s ../vscode/bin/code
```


## Adding a new version
Download one of the releases of [Visual Studio Code](https://code.visualstudio.com/download) and extract it:
```sh
$ cd ${HOME}/opt/vscode
$ wget https://go.microsoft.com/fwlink/?LinkID=620884 -O vscode-1.44.tar.gz
$ tar xfz vscode-1.44.tar.gz
```

Rename the extracted `VSCode-linux-x64` directory as `1.44` and create a
`default` symbolic link:
```sh
$ mv VSCode-linux-x64 1.44
```

Optionally, edit the `default` symbolic link to the new version:
```sh
$ ln -sf 1.44 default
```
