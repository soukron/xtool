# XTool wrapper


## Overview
XTool wrapper is a set of scripts which will make your life easier when keeping
your software organized and will allow you to run different versions of each one.

XTool wrapper is useful when dealing with software distributed as binary file 
(including AppImage format), distributed in a self-contained directory or in 
situations where you must keep different versions of the same software and being
able change between versions easily.


## Demo
![Demo Overview](resources/asciinema/overview-ascii.gif)


## The XTool wrapper
This is how a `xtool` wrapper looks like in the simplest way:
```sh
$ cat ${HOME}/opt/hello-world/bin/xtool
#!/bin/bash

# Configure xtool variables
XTOOL_NAME=hello-world
XTOOL_VERSION_VAR=XTOOL_HELLO_VERSION

# Include the main code from the xtool wrapper
source ${HOME}/opt/bin/xtool-main

# Launch the tool using the exec code from the xtool wrapper
source ${HOME}/opt/bin/xtool-exec
```

When using the `xtool` wrapper with a tool you will be able to use the 
`--xtool-info` parameter to see useful information about it like the path where
the tool is installed, the available versions to use, the name of the
environment variable to switch between versions and other information.

This parameter will only work if it's the only parameter sent to the execution.


## Configuration
Here's the list of the variables that can be defined in your `xtool` wrapper 
before sourcing the two scripts:
| Variable | Required | Explanation |
| -------- | -------- | ----------- | 
| `XTOOL_NAME` | Yes |  Use it to define the name of the tool. It will be used to find the default location |
| `XTOOL_VERSION_VAR` | Yes | Use it to define the environment variable which will be used to switch between versions |
| `XTOOL_BASEDIR` | No | Use it to define the software location if it's not in the default location. Default:  `${HOME}/opt/${XTOOL_NAME}` |
| `XTOOL_BINDIRS` | No | Use it to provide a comma-separated list of directories to be included in the `${PATH}` before running the final binary. Example:`XTOOL_BINDIRS=bin,sbin` | 
| `XTOOL_LIBDIRS` | No | Use it to provide a comma-separated list of directories to be included in the `${LD_LIBRARY_PATH}` before running the final binary. Example: `XTOOL_LIBDIRS=lib,lib64` | 


## Installation
Create the directory where all your software will reside (`${HOME}/opt` by default):
```sh
$ mkdir ${HOME}/opt
$ mkdir ${HOME}/opt/bin
```

Download the latest release of `xtool` and extract it in `${HOME}/opt/xtool/`:
```sh
$ mkdir -p ${HOME}/opt/xtool && cd $_
$ wget https://github.com/soukron/xtool/archive/v1.0.0.zip
$ unzip v1.0.0.zip
```

Rename the `xtool-v1.0.0` directory and create a `default` symbolic link:
```sh
$ mv xtool-v1.0.0 1.0.0
$ ln -s 1.0.0 default
```

Link the scripts in `${HOME}/opt/bin`:
```sh
$ cd ${HOME}/opt/bin
$ ln -s ../xtool/default/lib/xtool-exec
$ ln -s ../xtool/default/lib/xtool-main
```

**Note**: Remember to add `${HOME}/opt/bin` to your `${PATH}` in `.bashrc` or any
other init script you have.


## Adding software
Each new software must have a fixed directory structure so all above works as 
expected:
- a directory in `${HOME}/opt` for the tool with a name that identifies it 
properly (in example `hello-world`)
- inside the application directory must exist:
  - one subdirectory for each version, named with the version (in example `1.0.0`)
  - a symbolic link to the default version which be used if no other version is
forced, named `default`
  - a subdiretory named `bin` where must exist:
    - the XTool wrapper (in example `xtool`)
    - a symbolic link to the XTool wrapper with the name of each of the binaries
of the application (in example `hello`)
- inside the `${HOME}/bin/` directory must exist symbolic links to the binaries
of the application

With all above, this would be the tree directory of a fresh XTool installation with
several versions of `hello-world` installed:
```sh
$ tree ${HOME}/opt
/home/soukron/opt
├── bin
│   ├── hello -> ../hello-world/bin/hello
│   ├── xtool-exec -> ../xtool/default/lib/xtool-exec
│   └── xtool-main -> ../xtool/default/lib/xtool-main
├── hello-world
│   ├── 1.0.0
│   │   └── hello
│   ├── 1.0.1
│   │   └── hello
│   ├── 1.1.0
│   │   └── hello
│   └── bin
│       ├── hello -> xtool
│       └── xtool
└── xtool
    ├── 1.0.0
    │   └── lib
    │       ├── xtool-exec
    │       └── xtool-main
    └── default -> 1.0.0
```
  

## Reference installations
See a list of some tools that I use with XTool wrapper including their 
installation instructions and their `xtool` scripts:

| Software | README | Ready |
| -------- | ------ | ----- |
| go | [resources/guides/go.md][guides-go] | Yes |
| oc | [resources/guides/oc.md][guides-oc] | To be done |
| openshift-installer | [resources/guides-openshift-installer.md][guides-openshift-installer] | To be done |
| postman | [resources/giudes/postman.md][guides-postman] | To be done |
| sidequest | [resources/guides/sidequest.md][guides-sidequest] | To be done |
| vscode | [resources/guides/vscode.md][guides-vscode] | Yes |


## Todo
- Better error handling
- Add `--xtool-set-default` parameter to change the default version of a tool
- Add `xtool-cmd` as an standalone script to list and manage the installed software

## Contact
Reach me in [Twitter] or email in soukron _at_ gmbros.net


## License
Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the 
License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
CONDITIONS OF ANY KIND, either express or implied. See the License for the 
specific language governing permissions and limitations under the License.

[Twitter]:http://twitter.com/soukron
[guides-crc]: <https://github.com/soukron/xtool/tree/master/resources/guides/crc.md>
[guides-go]: <https://github.com/soukron/xtool/tree/master/resources/guides/go.md>
[guides-oc]: <https://github.com/soukron/xtool/tree/master/resources/guides/oc.md>
[guides-openshift-installer]: <https://github.com/soukron/xtool/tree/master/resources/guides/openshift-installer.md>
[guides-postman]: <https://github.com/soukron/xtool/tree/master/resources/guides/postman.md>
[guides-sidequest]: <https://github.com/soukron/xtool/tree/master/resources/guides/sidequest.md>
[guides-vscode]: <https://github.com/soukron/xtool/tree/master/resources/guides/vscode.md>
