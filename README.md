# A template for C++ micro-experiments  

This is a template project for C++ micro-experimentation using CLion.
The goal is to have a template that allows you to very quickly get
started in a new template, writing tests and. It's a pain in the ass
to spend time on mundane configuration when you want to experiment
with language features or explore TDD in C++.

This template is unashamedly optimised for the CLion IDE, so a set of
project files are included that mean you can open the project
immediately after cloning, and have a usable configuration to write
and run tests.

## Prerequisites

We assume these things:

- That you have a complete and current install of Clang and the libc++
  standard library.
  
- That CLion knows where to find your Clang toolchain - you should
  have it set up as a toolchain configuration in CLion. If the clang
  toolchain isn't your default, you may need to select it from the
  toolchain dropdown in `Settings | Build | CMake | Toolchain`.
    
- That you have a current version of CLion. Because this template
  makes heavy use of CLion's project files as well as CMake to enable
  config-free coding.  So, if you want to use template, keep CLion up
  to date!

This template works best using GitHub's ability to create a new
repository for you based on a template - look for the green button to
the left of the screen. After selecting this option, GitHub will
prompt you for the usual repository parameters, and will create the
new repository under your own account.

Clone your new project and open in CLion. CMake will display a prompt
warning you that nefarious people might sneak untrustworthy code into
your CMake project. We are not nefarious: select "trust this project".

Next, CLion will want you to confirm the shared debug build
configuration. If you have the prerequisites, you can hit "OK" to
confirm, and then you're ready to go.

Note that when you first open the project, two things are going to be
slow:

1. Generating the CMake build will take a while, because the test
   dependencies are being fetched from Git repositories, and their
   respective CMake builds generated. This is a one-time cost.

2. Compiling the project for the first time - the test runner in
   particular is slow to compile, but you'll never need to touch it
   after that first run.

After the build is generated by CLion and CMake, you should be able to
immediately go choose the menu item `Run | Run 'All Tests'`, and CLion
will build and run the tests, and show you a single test
result. You're up and running.

## What you get

### A basic source file structure

The template will generate an uncontroversial directory structure with
placeholder source files where they're needed.

CLion makes it easy to move and rename files within the project, so
make any changes you need. Note that the test library dependences are
factored out to a separate CMake file which is then `include`'d in the
main CMakeLists.txt - to help keep the core CMake build clear and
readable.

```
.
├── include
├── src
├── test
├── README.md
├── CMakeDependencies.cmake
└── CMakeLists.txt
```

And of course because you're working from a repository that's already
in your own GitHub, you're immediately able to commit and push changes
to that remote.


### A CLion build configuration for Clang

You get a CLion build configuration for a debug build that explicitly
assumes Clang, libc++ and applies `std=c++17`. Warnings are set to
`-Wall` and adds specific recommended warnings. You can easily edited
these in the CLion settings if they don't suit you, but these are the
defaults.

You can, of course, add other build configurations for `Release`,
`MinSizeRel`, `RelWithDebInfo`, as well as specialised configurations
for use cases such as profiling or code coverage. This template gives
you `Debug`, and the rest is up to you.

### Test libaries and runner

Test libraries are automatically fetched and available to you and
linked to the executable.

You get a single unit test runner configuration `All Tests` that runs
with no filters or exclusions. CLion will know that this is a Catch2
runner, and show nicely formatted tests results in the IDE.