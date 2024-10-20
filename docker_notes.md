# dockerized n64 libdragon toolchain

## quickstart

```



## commands

### `docker_build`

build the docker image. you only need to do this once, unless you change the Dockerfile


### `docker_sdk_run [cmd]`

start container with toolchain available (e.g. mips64-elf-gcc compiler) and run the specified command.

### `docker_sdk_shell`

start a container running bash, with networking connected to host.
useful to keep a container running for interactive development and connecting from VSCode.
 