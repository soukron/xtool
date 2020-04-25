# Go installation guide for XTool wrapper


## Installation
Create the directory for Go versions:
```sh
$ mkdir ${HOME}/opt/go
$ cd ${HOME}/opt/go
```

Download one of the stable releases of [Go](https://golang.org/dl/) and extract it:
```sh
$ wget https://dl.google.com/go/go1.13.10.linux-amd64.tar.gz
$ tar xfz go1.13.10.linux-amd64.tar.gz
```

Rename the extracted `go` directory as `1.13.10` and create a `default` symbolic link:
```sh
$ mv go 1.13.10
$ ln -s 1.13.10 default
```

Create the `xtool` wrapper in `bin`:
```sh
$ mkdir bin
$ cd bin
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

Link the `xtool` wrapper with the name of the binaries (go, gofmt):
```sh
$ ln -s xtool go
$ ln -s xtool gofmt
```

Link the binaries in the top directory `${HOME}/opt/bin`:
```sh
$ cd ${HOME}/opt/bin
$ ln -s ../go/bin/go
$ ln -s ../go/bin/gofmt
```


## Adding a new version
Download the desired release of [Go](https://golang.org/dl/) and extract it:
```sh
$ cd ${HOME}/opt/go
$ wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
$ tar xfz go1.14.2.linux-amd64.tar.gz
```

Rename the extracted `go` directory as `1.14.2`:
```sh
$ mv go 1.14.2
$ ln -s 1.14.2 default
```

Optionally, edit the `default` symbolic link to the new version:
```sh
$ ln -sf 1.14.2 default
```
