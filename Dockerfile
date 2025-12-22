FROM ghcr.io/volinhtruc/bico_ubuntu:22.04_0.0.0

ARG KICAD_VERSION_ARG=9.0
ENV KICAD_VERSION=${KICAD_VERSION_ARG}

USER root

RUN apt update \
    && apt install -y software-properties-common 
RUN add-apt-repository --yes ppa:kicad/kicad-${KICAD_VERSION}-releases 
RUN apt update 
RUN apt install -y kicad

# Copy and set up entrypoint script (relative to .devcontainer/)
COPY .devcontainer/entrypoint.sh /entrypoint.sh
RUN sudo chmod +x /entrypoint.sh

# Clean up apt cache to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $USERNAME

CMD ["/entrypoint.sh", "bash"]