# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/workspaces/Tutorial/build/build/build/build/_deps/picotool-src"
  "/workspaces/Tutorial/build/build/build/build/_deps/picotool-build"
  "/workspaces/Tutorial/build/build/build/build/_deps"
  "/workspaces/Tutorial/build/build/build/build/picotool/tmp"
  "/workspaces/Tutorial/build/build/build/build/picotool/src/picotoolBuild-stamp"
  "/workspaces/Tutorial/build/build/build/build/picotool/src"
  "/workspaces/Tutorial/build/build/build/build/picotool/src/picotoolBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/workspaces/Tutorial/build/build/build/build/picotool/src/picotoolBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/workspaces/Tutorial/build/build/build/build/picotool/src/picotoolBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
