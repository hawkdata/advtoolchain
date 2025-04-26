#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <directory> <symbol>"
    exit 1
fi

SEARCH_DIR="$1"
SYMBOL="$2"

# Function to check symbols in object files and libraries
check_symbols() {
    local file="$1"
    local type=$(file "$file")
    
    # For shared libraries and object files
    if [[ $type == *"ELF"* ]]; then
        nm "$file" 2>/dev/null | grep -i "$SYMBOL" | while read -r line; do
            echo "File: $file"
            echo "Symbol: $line"
            echo "-------------------"
        done
    # For static libraries
    elif [[ $type == *"current ar archive"* ]]; then
        nm "$file" 2>/dev/null | grep -i "$SYMBOL" | while read -r line; do
            echo "File: $file"
            echo "Symbol: $line"
            echo "-------------------"
        done
    fi
}

# Find all object files, static libs, and shared libs
find "$SEARCH_DIR" -type f \( -name "*.o" -o -name "*.a" -o -name "*.so*" \) | while read -r file; do
    check_symbols "$file"
done