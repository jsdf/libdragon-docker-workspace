# dockerized n64 libdragon workspace

this repo aims to make libdragon easy to get started with, even if you
don't have much experience with docker.

i personally find docker's cli annoying and hard to remember, and i also had trouble
using the [libdragon-docker](https://github.com/anacierdem/libdragon-docker) command line
tool, so i made this set of scripts to simplify the process.

this repo is a thin wrapper around the libdragon docker image at:
https://github.com/dragonminded/libdragon/pkgs/container/libdragon

## quickstart

first make sure you've [installed docker](https://docs.docker.com/get-started/get-docker/). if you're on macOS you might also like to install and start [colima](https://github.com/abiosoft/colima), but this is not required.

```bash
git clone https://github.com/jsdf/libdragon-docker-workspace.git
cd libdragon-docker-workspace
chmod +x ./docker_*
./docker_build

# clone any other repos you want (e.g. game sources or templates) into this directory
git clone https://github.com/jsdf/my-game-template

# start a shell inside the docker environment, where you can compile your games.
# the /workspace directory of this container is the libdragon-docker-workspace directory.
./docker_run
```

now you're in a shell inside the docker container.
the compiled libdragon library and headers are installed at

- `/n64_toolchain/mips64-elf/lib/libdragon.a`
- `/n64_toolchain/mips64-elf/include/libdragon.h`

you can now `cd` into your game source directories and compile them.

```
$ cd /workspace/my-game-template
```

now build your game.

## commands

### `docker_build`

build the docker image. you only need to do this once, unless you change the Dockerfile.
this will install the n64 gcc compiler and use it to build libdragon.

### `docker_shell`

start a container (or reuse the container which is already running) with the n64 compiler toolchain available (e.g. mips64-elf-gcc compiler) and drop you into a bash shell.
this is useful for interactive development and connecting from VSCode.
 
### `docker_run [cmd]`

start a container (or reuse the container which is already running) with the n64 compiler toolchain available (e.g. mips64-elf-gcc compiler) and run the specified command.

### `docker_stop`

stop the currently running docker container
