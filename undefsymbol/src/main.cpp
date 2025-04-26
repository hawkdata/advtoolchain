//
// Created by root on 4/26/25.
//

#include <iostream>
#include <dlfcn.h>
#include <string>

int main() {
    std::cout << "Main program starting..." << std::endl;

    // Construct the path to the shared library
    std::string lib_path = "../shared_lib/libshared_lib.so";

    std::cout << "Attempting to load library: " << lib_path << std::endl;

    // Load the shared library - this is where the undefined symbol will be detected
    void* handle = dlopen(lib_path.c_str(), RTLD_NOW); // Using RTLD_NOW to force immediate symbol resolution

    if (!handle) {
        std::cerr << "Error loading library: " << dlerror() << std::endl;
        return 1;
    }

    // Clear any existing error
    dlerror();

    // Get the test function from the shared library
    typedef void (*function_ptr)();
    function_ptr testFunction = (function_ptr) dlsym(handle, "sharedLibFunction");

    const char* dlsym_error = dlerror();
    if (dlsym_error) {
        std::cerr << "Error locating function: " << dlsym_error << std::endl;
        dlclose(handle);
        return 1;
    }

    // Call the function
    std::cout << "Calling function from shared library..." << std::endl;
    testFunction();

    // Close the library
    dlclose(handle);
    std::cout << "Library closed. Main program exiting." << std::endl;

    return 0;
}

