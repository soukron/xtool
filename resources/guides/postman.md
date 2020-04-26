# Postman installation guide for XTool wrapper


## Installation
Create the directory for Postman versions:
```sh
$ mkdir ${HOME}/opt/postman && cd $_
```

Create the directory for the version which you're installing (in example `7.23.0`, which is the latest at the moment of writting this guide):
```sh
$ mkdir 7.23.0
```

Create a symbolic link to `7.23.0` directory to make it the default version:
```sh
$ ln -s 7.23.0 default
```

Download the release from [Postman downloads page](https://www.postman.com/downloads/) and extract it:
```sh
$ wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
$ tar xfz postman.tar.gz --strip-components 1 -C 7.23.0
```

Create the `bin` directory and the `xtool` wrapper:
```sh
$ mkdir bin && cd $_
$ cat <<EOF > xtool
#!/bin/bash

# Configure tool variables
XTOOL_NAME=postman
XTOOL_VERSION_VAR=XTOOL_POSTMAN_VERSION
XTOOL_BINDIRS=app

# Include the main code from the xtool
source ${HOME}/opt/bin/xtool-main

# Launch the tool using the exec code from the xtool
source ${HOME}/opt/bin/xtool-exec
EOF
$ chmod +x xtool
```

Link the `xtool` wrapper with the name of the binaries (`Postman`):
```sh
$ ln -s xtool Postman
```

Link the binaries again but this time in the top directory `${HOME}/opt/bin`:
```sh
$ cd ${HOME}/opt/bin
$ ln -s ../postman/bin/Postman
```

Cleanup the downloaded file:
```sh
$ rm -fr ${HOME}/opt/postman/postman.tar.gz
```


## Adding a new version
Create the directory for the version which you're adding (in example `7.23.0-canary01`, which is the canary at the moment of writting this guide):
```sh
$ cd ${HOME}/opt/postman
$ mkdir 7.23.0-canary01
```

Download the release from [Postman canary downloads page](https://www.postman.com/downloads/canary) and extract it:
```sh
$ wget https://dl.pstmn.io/download/channel/canary/linux_64 -O postman.tar.gz
$ tar xfz postman.tar.gz --strip-components 1 -C 7.23.0-canary01
```

Cleanup the downloaded file:
```sh
$ rm -fr ${HOME}/opt/postman/postman.tar.gz
```

Optionally, point the symbolic link to `1.44` directory to make it the default version:
```sh
$ ln -sf 7.23.0-canary01 default
```
