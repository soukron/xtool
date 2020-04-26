# Go installation guide for XTool wrapper


## Installation
Create the directory for Go versions:
```sh
$ mkdir ${HOME}/opt/go && cd $_
```

Create the directory for the version which you're installing (in example `1.13.10`):
```sh
$ mkdir 1.13.10
```

Create a symbolic link to `1.13.10` directory to make it the default version:
```sh
$ ln -s 1.13.10 default
```

Download the release from [Go downloads page](https://golang.org/dl/) and extract it:
```sh
$ wget https://dl.google.com/go/go1.13.10.linux-amd64.tar.gz
$ tar xfz go1.13.10.linux-amd64.tar.gz --strip-components 1 -C 1.13.10
```

Create the `bin` directory and the `xtool` wrapper:
```sh
$ mkdir bin && cd $_
$ cat <<EOF > xtool
#!/bin/bash

# Configure tool variables
XTOOL_NAME=go
XTOOL_VERSION_VAR=XTOOL_GO_VERSION
XTOOL_BINDIRS=bin
XTOOL_LIBDIRS=lib

# Include the main code from the xtool
source ${HOME}/opt/bin/xtool-main

# Define extra variables for Go
export GOROOT=${XTOOL_DIR}

# Launch the tool using the exec code from the xtool
source ${HOME}/opt/bin/xtool-exec
EOF
$ chmod +x xtool
```

Link the `xtool` wrapper with the name of the binaries (`go`, `gofmt`):
```sh
$ ln -s xtool go
$ ln -s xtool gofmt
```

Link the binaries again but this time in the top directory `${HOME}/opt/bin`:
```sh
$ cd ${HOME}/opt/bin
$ ln -s ../go/bin/go
$ ln -s ../go/bin/gofmt
```

Cleanup the downloaded file:
```sh
$ rm -fr ${HOME}/opt/go/go1.13.10.linux-amd64.tar.gz
```


## Adding a new version
Create the directory for the version which you're adding (in example `1.14.2`):
```sh
$ cd ${HOME}/opt/go
$ mkdir 1.14.2
```

Download the release from [Go downloads page](https://golang.org/dl/) and extract it:
```sh
$ wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
$ tar xfz go1.14.2.linux-amd64.tar.gz --strip-components 1 -C 1.14.2
```

Cleanup the downloaded file:
```sh
$ rm -fr ${HOME}/opt/go/go1.14.2.linux-amd64.tar.gz
```

Optionally, point the symbolic link to `1.14.2` directory to make it the default version:
```sh
$ ln -sf 1.14.2 default
```
