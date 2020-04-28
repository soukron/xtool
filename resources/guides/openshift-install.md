# OpenShift Installer installation guide for XTool wrapper


## Installation
Create the directory for OpenShift Installer versions:
```sh
$ mkdir -p ${HOME}/opt/openshift-install/bin && cd $_
```

Download the XTool wrapper:
```sh
$ wget https://raw.githubusercontent.com/soukron/xtool/add-release/resources/guides/openshift-install.xtool -O xtool
$ chmod +x xtool
```

Install your initial release (in example: `4.3.12`):
```sh
$ ./xtool --xtool-add-release 4.3.12
```


## Adding a new version
Use the `--xtool-add-release` parameter as previously to install a new release (in example: `4.3.17`):
```sh
$ openshift-install --xtool-add-release 4.3.17
```

Optionally, point the `default` symbolic link to `4.3.17` directory to make it the default version:
```sh
$ ln -sf 4.3.17 ${HOME}/opt/openshift-install/default
```
