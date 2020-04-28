# SideQuest installation guide for XTool wrapper


## Installation
Create the directory for SideQuest versions:
```sh
$ mkdir ${HOME}/opt/sidequest && cd $_
```

Create the directory for the version which you're installing (in example `0.10.0`):
```sh
$ mkdir 0.10.0
```

Create a symbolic link to `0.10.0` directory to make it the default version:
```sh
$ ln -s 0.10.0 default
```

Download the release from [SideQuest downloads page](https://github.com/the-expanse/SideQuest/releases) and extract it:
```sh
$ wget https://github.com/the-expanse/SideQuest/releases/download/v0.10.0/SideQuest-0.10.0.tar.xz
$ tar xfJ SideQuest-0.10.0.tar.xz --strip-components 1 -C 0.10.0
```

Create the `bin` directory and the `xtool` wrapper:
```sh
$ mkdir bin && cd $_
$ cat <<EOF > xtool
#!/bin/bash

# Configure tool variables
export XTOOL_NAME=sidequest
export XTOOL_VERSION_VAR=XTOOL_SIDEQUEST_VERSION

# Include the main code from the xtool
source ${HOME}/opt/bin/xtool-main

# Launch the tool using the exec code from the xtool
source ${HOME}/opt/bin/xtool-exec
EOF
$ chmod +x xtool
```

Link the `xtool` wrapper with the name of the binaries (`Postman`):
```sh
$ ln -s xtool sidequest
```

Link the binaries again but this time in the top directory `${HOME}/opt/bin`:
```sh
$ cd ${HOME}/opt/bin
$ ln -s ../sidequest/bin/sidequest
```

Cleanup the downloaded file:
```sh
$ rm -fr ${HOME}/opt/sidequest/SideQuest-0.10.0.tar.xz
```


## Adding a new version
Create the directory for the version which you're adding (in example `0.10.3`):
```sh
$ cd ${HOME}/opt/sidequest
$ mkdir 0.10.3
```

Download the release from [SideQuest downloads page](https://github.com/the-expanse/SideQuest/releases) and extract it:
```sh
$ wget https://github.com/the-expanse/SideQuest/releases/download/v0.10.0/SideQuest-0.10.3.tar.xz
$ tar xfJ SideQuest-0.10.3.tar.xz --strip-components 1 -C 0.10.3
```

Cleanup the downloaded file:
```sh
$ rm -fr ${HOME}/opt/sidequest/SideQuest-0.10.3.tar.xz
```

Optionally, point the symbolic link to `1.44` directory to make it the default version:
```sh
$ ln -sf 0.10.3 default
```
