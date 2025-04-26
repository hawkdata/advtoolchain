#!/bin/bash

# Build the project
mkdir -p build
cd build
cmake ..
make

# Return to project root
cd ..

echo "Build completed! Run the program with:"
echo "./build/src/main_program"