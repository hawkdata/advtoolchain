#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <symbol_name> <file1> [file2 ...]"
    echo "Searches for symbol in object files (.o), static libraries (.a), or shared libraries (.so)"
    exit 1
fi

symbol="$1"
shift

for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "File not found: $file"
        continue
    fi
    # Store the search results in a variable
    case "$file" in
        *.o|*.a)
            # For object files and static libraries
            result=$(nm "$file" 2>/dev/null | grep "$symbol")
            ;;
        *.so|*.so.*)
            # For shared libraries
            result=$(nm -D "$file" 2>/dev/null | grep "$symbol")
            ;;
        *)
            echo "Unsupported file type: $file"
            continue
            ;;
    esac

    # Only show file name and results if symbol was found
    if [ -n "$result" ]; then
        echo "Found in $file:"
        echo "$result"
    fi
    ####
    #In the output of the `nm` command, the symbol type `T` indicates that the symbol is **defined in the text (code) section** of the object file or library. This typically means that the symbol represents a function or code that has been defined in the file.

### Key Points:
#- **`T` (uppercase)**: The symbol is defined in the text section and is globally accessible (i.e., it can be referenced by other object files or libraries).
#- **`t` (lowercase)**: The symbol is defined in the text section but is local to the file (i.e., it has internal linkage and cannot be accessed from outside the file).


done