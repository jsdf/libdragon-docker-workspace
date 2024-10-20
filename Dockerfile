FROM ghcr.io/dragonminded/libdragon:preview

WORKDIR /workspace
RUN git clone https://github.com/DragonMinded/libdragon.git
RUN cd libdragon && ./build.sh 
