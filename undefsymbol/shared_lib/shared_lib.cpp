
#include <iostream>
#include "lib_a.h"
#include "lib_b.h"

// Reference to the missing function which will be sought at runtime
// extern void missingFunction();

extern "C" {
    void sharedLibFunction() {
        std::cout << "Shared library function called" << std::endl;

        // Call function from static library A
        funcA();

        // Call function from static library B
        funcB();

        // Try to call the missing function
        std::cout << "About to call the missing function..." << std::endl;
        missingFunction();  // This will cause a runtime error when called, but not during linking
    }
}
