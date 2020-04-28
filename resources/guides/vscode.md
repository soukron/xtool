# Visual Studio Code installation guide for XTool wrapper


## Installation
Create the directory for Visual Studio Code versions:
```sh
$ mkdir ${HOME}/opt/vscode && cd $_
```

Create the directory for the version which you're installing (in example `1.42`):
```sh
$ mkdir 1.42
```

Create a symbolic link to `1.42` directory to make it the default version:
```sh
$ ln -s 1.42 default
```

Download the release from [Visual Studio Code downloads page](https://code.visualstudio.com/download) and extract it:
```sh
$ wget https://go.microsoft.com/fwlink/?LinkID=320381 -O vscode-1.42.tar.gz
$ tar xfz vscode-1.42.tar.gz --strip-components 1 -C 1.42
```

Create the `bin` directory and the `xtool` wrapper:
```sh
$ mkdir bin && cd $_
$ cat <<EOF > xtool
#!/bin/bash

# Configure tool variables
export XTOOL_NAME=vscode
export XTOOL_VERSION_VAR=VSCODE_VERSION
export XTOOL_BINDIRS=bin

# Include the main code from the xtool
source ${HOME}/opt/bin/xtool-main

# Launch the tool using the exec code from the xtool
source ${HOME}/opt/bin/xtool-exec
EOF
$ chmod +x xtool
```

Link the `xtool` wrapper with the name of the binaries (`code`):
```sh
$ ln -s xtool code
```

Link the binaries again but this time in the top directory `${HOME}/opt/bin`:
```sh
$ cd ${HOME}/opt/bin
$ ln -s ../vscode/bin/code
```

Cleanup the downloaded file:
```sh
$ rm -fr ${HOME}/opt/vscode/vscode-1.42.tar.gz
```


## Adding a new version
Create the directory for the version which you're adding (in example `1.44`):
```sh
$ cd ${HOME}/opt/vscode
$ mkdir 1.44
```

Download the release from [Visual Studio Code downloads page](https://code.visualstudio.com/download) and extract it:
```sh
$ wget https://go.microsoft.com/fwlink/?LinkID=620884 -O vscode-1.44.tar.gz
$ tar xfz vscode-1.44.tar.gz --strip-components 1 -C 1.44
```

Cleanup the downloaded file:
```sh
$ rm -fr ${HOME}/opt/vscode/vscode-1.44.tar.gz
```

Optionally, point the symbolic link to `1.44` directory to make it the default version:
```sh
$ ln -sf 1.44 default
```
