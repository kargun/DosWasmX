# DOS Wasm X DevContainer

This devcontainer provides a complete build environment for DOS Wasm X with all dependencies pre-installed.

## Prerequisites

- Visual Studio Code
- Docker Desktop
- Dev Containers extension for VS Code

## Getting Started

1. Open the project in VS Code
2. When prompted, click "Reopen in Container" or use `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"
3. Wait for the container to build (first time only)

## Building

Once in the devcontainer, you can build DOS Wasm X in several ways:

### Option 1: Use the build script
```bash
./.devcontainer/build.sh
```

### Option 2: Manual build
```bash
# Navigate to code directory
cd code

# Source emscripten environment (automatically done in devcontainer)
source /emsdk/emsdk_env.sh

# Build
make
```

### Handling Build Errors

If you encounter the `EM_CACHE_IS_LOCKED` error (as mentioned in the main README):

1. Copy the failing `emcc` command from the error output
2. Run it manually in the terminal
3. Run `make` again to complete the build

## What's Included

- Ubuntu 22.04 base
- Emscripten 3.1.57 - arm64-linux binaries available for download
- Custom `wasm-opt` binary with Exceptions + Asyncify support
- All build dependencies (cmake, git, nodejs, etc.)
- Pre-configured environment variables

## Output

Built files will be updated in the `dist/` folder:
- `main.js` - Main JavaScript file
- `main.wasm` - WebAssembly binary

## Serving the Application

After building, you can serve the `dist/` folder with any web server:

```bash
# Using Python
cd dist
python3 -m http.server 8000

# Using Node.js (if you have http-server installed)
cd dist
npx http-server

# Using VS Code Live Server extension
# Right-click on dist/index.html → "Open with Live Server"
```

Then navigate to `http://localhost:8000` to test your build.