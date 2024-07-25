#!/bin/bash
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"
cd "${PROJECT_DIR}" || exit 1
cmake --build . --target wgrib2_exe -j $(nproc)
gcc -shared -o wgrib2/libwgrib2.so -Wl,--whole-archive "wgrib2/libwgrib2.a" -Wl,--no-whole-archive
