#!/bin/bash

# DOS Wasm X Build Script for DevContainer
echo "Building DOS Wasm X..."

# Source emscripten environment
source /emsdk/emsdk_env.sh

# Navigate to code directory
cd /workspace/code

# Run make
echo "Running make..."
make

# Check if build failed with EM_CACHE_IS_LOCKED error
if [ $? -ne 0 ]; then
    echo ""
    echo "Build failed. This might be the EM_CACHE_IS_LOCKED error mentioned in the README."
    echo "If you see an emcc command in the error output above, copy and run it manually."
    echo "Then run 'make' again to finish building."
    echo ""
    echo "Example:"
    echo "1. Copy the failing emcc command from the error output"
    echo "2. Run it manually in this terminal"
    echo "3. Run 'make' again"
    exit 1
else
    echo ""
    echo "Build completed successfully!"
    echo "Updated files should be in the /workspace/dist/ folder"
    echo ""
fi