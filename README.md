# XTool wrapper


## Overview
XTool wrapper is a set of scripts which will make your life easier when keeping
your software organized and will allow you to run different versions of each one.

XTool wrapper is useful when dealing with software distributed as binary file 
(including AppImage format), distributed in a self-contained directory or in 
situations where you must keep different versions of the same software and being
able change between versions easily.

XTool is not meant to be a package manager replacement. If you're happy with the
software distributed in repositories, that's probably the best way to manage your
software.


## Demo
![Demo Overview](resources/asciinema/overview-ascii.gif)


## The XTool wrapper
This is how a `xtool` wrapper looks like in the simplest way:
```sh
$ cat ${HOME}/opt/hello-world/bin/xtool
#!/bin/bash

# Configure xtool variables
export XTOOL_NAME=hello-world
export XTOOL_VERSION_VAR=XTOOL_HELLO_VERSION

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
Clone [or download](https://github.com/soukron/xtool/releases) this repository:
```sh
$ wget https://github.com/soukron/xtool/archive/master.tar.gz
$ tar xfz master.tar.gz
```

Run the installer:
```sh
$ cd xtool-master
$ bin/install.sh
```

**IMPORTANT**: Remember to add `${HOME}/opt/bin` to your `${PATH}` in `.bashrc` or any
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
  

## Installation guides
See a list of some tools that I use with XTool wrapper including their 
installation instructions and their `xtool` scripts:

| Software | Installation Guide | Ready |
| -------- | ------ | ----- |
| aws-cli | [resources/guides/aws.md][guides-aws] | To be done |
| betaflight-configurator | [resources/guides/betaflight.md][guides-betaflight] | To be done |
| cura | [resources/guides/cura.md][guides-cura] | To be done |
| go | [resources/guides/go.md][guides-go] | Yes |
| openshift-client (oc) | [resources/guides/openshift-client.md][guides-openshift-client] | Yes |
| openshift-install | [resources/guides-openshift-install.md][guides-openshift-install] | Yes |
| postman | [resources/giudes/postman.md][guides-postman] | Yes |
| sidequest | [resources/guides/sidequest.md][guides-sidequest] | Yes |
| vscode | [resources/guides/vscode.md][guides-vscode] | Yes |


## Todo
- Better error handling
- Make the software directory configurable at installation time
- Add `--xtool-set-default` parameter to change the default version of a tool
- Add `xtool-cmd` as an standalone script to list and manage the installed software
- Create a plugin system to delegate the installation/addition/removal of software

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
[guides-aws]: <https://github.com/soukron/xtool/tree/master/resources/guides/aws.md>
[guides-betaflight]: <https://github.com/soukron/xtool/tree/master/resources/guides/betaflight.md>
[guides-cura]: <https://github.com/soukron/xtool/tree/master/resources/guides/cura.md>
[guides-go]: <https://github.com/soukron/xtool/tree/master/resources/guides/go.md>
[guides-openshift-client]: <https://github.com/soukron/xtool/tree/master/resources/guides/openshift-client.md>
[guides-openshift-install]: <https://github.com/soukron/xtool/tree/master/resources/guides/openshift-install.md>
[guides-postman]: <https://github.com/soukron/xtool/tree/master/resources/guides/postman.md>
[guides-sidequest]: <https://github.com/soukron/xtool/tree/master/resources/guides/sidequest.md>
[guides-vscode]: <https://github.com/soukron/xtool/tree/master/resources/guides/vscode.md>
