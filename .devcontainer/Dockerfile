FROM ubuntu:22.04

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    python3 \
    nodejs \
    npm \
    wget \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Set up emscripten - 3.1.57 was the first release with arm64-linux binaries
WORKDIR /emsdk
RUN git clone https://github.com/emscripten-core/emsdk.git . \
    && ./emsdk install 3.1.57 \
    && ./emsdk activate 3.1.57

# Copy custom wasm-opt (this replaces the default Binaryen wasm-opt)
# The custom version supports Exceptions and Asyncify together
COPY code/wasm-opt /emsdk/upstream/bin/wasm-opt
RUN chmod +x /emsdk/upstream/bin/wasm-opt

# Set up environment variables
ENV EMSDK=/emsdk
ENV PATH="/emsdk:/emsdk/upstream/emscripten:/emsdk/upstream/bin:${PATH}"
ENV EMSDK_NODE="/emsdk/node/16.20.0_64bit/bin/node"

# Create workspace directory
WORKDIR /workspace

# Source emscripten environment on shell startup
RUN echo 'source /emsdk/emsdk_env.sh' >> ~/.bashrc

# Set default shell to bash
SHELL ["/bin/bash", "-c"]