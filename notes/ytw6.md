# CMake

## Boilerplate
[Reference](https://cmake.org/cmake/help/latest/guide/tutorial/A%20Basic%20Starting%20Point.html#exercise-2-specifying-the-c-standard)
Boilerplate commands to include at the start of the **project root CMakeLists.txt**
```
cmake_minimum_required(VERSION <version-number>)
project(<name>)
add_executable(<executable-name> <source-files>)
set(CMAKE_CXX_STANDARD <cpp-standard>)
set(CMAKE_CXX_STANDARD_REQUIRED True)
```
- version-number: minimum version of CMake to use
    - Check version number with `cmake --version`
- name: name to give the project
- source-files: \*.cpp files to link into the executable
- executable-name: name to give the executable
- cpp-standard: [list of available cpp standards](#https://cmake.org/cmake/help/latest/prop_tgt/CXX_STANDARD.html#prop_tgt:CXX_STANDARD)

## find-package
For built-in modules, CMake provides Find<module-name>.cmake modules as a target
for find_package

If find_package is successful, CMake will set some variables. You can link to the 
found library with these set variables. [Available variables](https://cmake.org/cmake/help/book/mastering-cmake/chapter/Finding%20Packages.html) 


**Note that only CMake-provided modules set these variables**
These 'built-in Find<module-name>.cmake modules' are distinct from user provided 
Find<module-name>.cmake modules.

## How to find library targets
find_packages will look for a Find<module-name>.cmake file, then get the targets
defined inside that file. To find out what these targets are, look for `find_library`
or `add_library <library-name> IMPORTED` declarations in those cmake files
    - these are common declarations for targets

Example from FindOpenGL.cmake:

```
elseif (APPLE)
  # The OpenGL.framework provides both gl and glu
  find_library(OPENGL_gl_LIBRARY OpenGL DOC "OpenGL library for OS X")
  find_library(OPENGL_glu_LIBRARY OpenGL DOC
    "GLU library for OS X (usually same as OpenGL library)")
  find_path(OPENGL_INCLUDE_DIR OpenGL/gl.h DOC "Include for OpenGL on OS X")
  list(APPEND _OpenGL_REQUIRED_VARS OPENGL_INCLUDE_DIR)

  list(APPEND _OpenGL_CACHE_VARS
    OPENGL_INCLUDE_DIR
    OPENGL_gl_LIBRARY
    OPENGL_glu_LIBRARY
    )
else()
    ...
```
To look for the Find<module-name>.cmake file: `find <dir> -name *<module-name>*cmake`
     - dir: directory to recursively search from using `find`
     - the search term is some kind of shell glob pattern
        - look for a file containing the module name, contains 'find', and ends in 'cmake'

In the above snippet the link targets are identified from the `find_library`.
From this we can deduce the commands needed to link to OpenGL on Mac:
```
find_package(OpenGL) -> Tells CMake to find 'FindOpenGL.cmake'
target_link_libraries(<target> ${OPENGL_gl_LIBRARY} ${OPENGL_glu_LIBRARY})

```

#cmake #cpp


