cmake_minimum_required(VERSION 3.19)
project(cpp-clion-template)

set(CMAKE_CXX_STANDARD 17)

# The dependencies for the test frameworks are kept in a separate
# CMake file, to keep this core CMakeLists clear and simple.  The
# manifest for the current dependencies and versions are as follows:
#
# catch2      : v2.13.6 (5c88067bd339465513af4aec606bd2292f1b594a)
# trompeloeil : v41 (83f7d0cdbb08c68fe29b17c6672ae845a301a103)
#
include(CMakeDependencies.cmake)

# For the sake of form, we keep the "production" sources separate from
# tests. The production sources are linked as a static library to the
# test runner executable. If your experiment is header only, you can
# delete this.
#
# When you create a new "production" source file, CLion should prompt
# you to add the file to this target.
#
add_library(experiment SHARED
        src/experiment.cpp)
target_include_directories(experiment PRIVATE
        ${PROJECT_SOURCE_DIR}/include)

# The test executable comprises a suite of tests (assuming you'll be
# adding more) and the test runner `main()`. The `main.cpp` should be
# adequate out of the box, and you can safely ignore it in most cases.
#
# When you create a new test source file, CLion should prompt you to
# add the new file to this target.
#
add_executable(test_runner
        test/test_cases.cpp
        test/main.cpp)

# Tests can include test frameworks of course, as well as the shared
# /include directory in this project
#
target_include_directories(test_runner PRIVATE
        ${PROJECT_SOURCE_DIR}/include
        ${catch2_SOURCE_DIR}/single_include/catch2
        ${trompeloeil_SOURCE_DIR}/include)
target_link_libraries(test_runner experiment trompeloeil)
