# dockerized n64 libdragon toolchain

## quickstart

```bash
git clone https://github.com/jsdf/libdragon-docker-workspace.git
cd libdragon-docker-workspace
chmod +x ./docker_*
./docker_build


git clone https://github.com/DragonMinded/libdragon.git

# clone any other repos you want (e.g. game sources or templates) into this directory
git clone https://github.com/jsdf/my-game-template

# start a shell inside the docker environment, where you can compile your games.
# the /workspace directory of this container is the libdragon-docker-workspace directory.
./docker_sdk_run
```

inside the shell you can now build libdragon

```
root@1c6b2ee2bb64:/workspace#

$ cd libdragon
$ ./build.sh # should end with "Libdragon built successfully!"
```

the compiled libdragon library and headers will now be installed at

- `/n64_toolchain/mips64-elf/lib/libdragon.a`
- `/n64_toolchain/mips64-elf/include/libdragon.h`

you can now `cd` into your game source directories and compile them.

```
$ cd /workspace/my-game-template
# now build your game
```

## commands

### `docker_build`

build the docker image. you only need to do this once, unless you change the Dockerfile

### `docker_sdk_shell`

start a container running bash, with networking connected to host.
useful to keep a container running for interactive development and connecting from VSCode.
 
### `docker_sdk_run [cmd]`

start container with toolchain available (e.g. mips64-elf-gcc compiler) and run the specified command.
