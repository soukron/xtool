# OpenShift Client (oc) installation guide for XTool wrapper


## Installation
Create the directory for OpenShift Client versions:
```sh
$ mkdir ${HOME}/opt/oc && cd $_
```

Create the directory for the version which you're installing (in example `4.3.12`):
```sh
$ mkdir 4.3.12
```

Create a symbolic link to `4.3.12` directory to make it the default version:
```sh
$ ln -s 4.3.12 default
```

Download the release from [oc downloads mirror](https://mirror.openshift.com/pub/openshift-v4/clients/ocp/) and extract it:
```sh
$ wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.3.12/openshift-client-linux.tar.gz
$ tar xfz openshift-client-linux.tar.gz -C 4.3.12
```

Create the `bin` directory and the `xtool` wrapper:
```sh
$ mkdir bin && cd $_
$ cat <<EOF > xtool
#!/bin/bash

# Configure tool variables
XTOOL_NAME=oc
XTOOL_VERSION_VAR=XTOOL_OC_VERSION

# Include the main code from the xtool
source ${HOME}/opt/bin/xtool-main

# Launch the tool using the exec code from the xtool
source ${HOME}/opt/bin/xtool-exec
EOF
$ chmod +x xtool
```

Link the `xtool` wrapper with the name of the binaries (oc, kubectl):
```sh
$ ln -s xtool oc
$ ln -s xtool kubectl
```

Link the binaries again but this time in the top directory `${HOME}/opt/bin`:
```sh
$ cd ${HOME}/opt/bin
$ ln -s ../oc/bin/oc
$ ln -s ../oc/bin/kubectl
```

Cleanup the downloaded file:
```sh
$ rm -fr ${HOME}/opt/oc/openshift-client-linux.tar.gz
```


## Adding a new version
Create the directory for the version which you're adding (in example `4.3.17`):
```sh
$ cd ${HOME}/opt/oc
$ mkdir 4.3.17
```

Download the release from [oc downloads mirror](https://mirror.openshift.com/pub/openshift-v4/clients/ocp/) and extract it:
```sh
$ wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.3.17/openshift-client-linux.tar.gz
$ tar xfz openshift-client-linux.tar.gz -C 4.3.17
```

Cleanup the downloaded file:
```sh
$ rm -fr ${HOME}/opt/oc/openshift-client-linux.tar.gz
```

Optionally, point the symbolic link to `4.3.17` directory to make it the default version:
```sh
$ ln -sf 4.3.17 default
```
