FROM ghcr.io/dragonminded/libdragon:preview as build

WORKDIR /n64_toolchain
RUN git clone -b preview https://github.com/DragonMinded/libdragon.git
RUN echo "building libdragon" && cd libdragon && ./build.sh
RUN git clone https://github.com/HailToDodongo/tiny3d.git
RUN echo "building tiny3d" && cd tiny3d && export N64_INST=/n64_toolchain && ./build.sh
RUN touch env.sh && echo "export N64_INST=/n64_toolchain" >> env.sh && echo "export T3D_INST=/n64_toolchain/tiny3d" >> env.sh
RUN echo "source /n64_toolchain/env.sh" >> ~/.bashrc
CMD [ "bash" ]