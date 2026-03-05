# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/workspaces/Tutorial/pico-sdk/tools/pioasm"
  "/workspaces/Tutorial/build/build/build/build/pioasm"
  "/workspaces/Tutorial/build/build/build/build/pioasm-install"
  "/workspaces/Tutorial/build/build/build/build/pico-sdk/src/rp2_common/pico_status_led/pioasm/tmp"
  "/workspaces/Tutorial/build/build/build/build/pico-sdk/src/rp2_common/pico_status_led/pioasm/src/pioasmBuild-stamp"
  "/workspaces/Tutorial/build/build/build/build/pico-sdk/src/rp2_common/pico_status_led/pioasm/src"
  "/workspaces/Tutorial/build/build/build/build/pico-sdk/src/rp2_common/pico_status_led/pioasm/src/pioasmBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/workspaces/Tutorial/build/build/build/build/pico-sdk/src/rp2_common/pico_status_led/pioasm/src/pioasmBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/workspaces/Tutorial/build/build/build/build/pico-sdk/src/rp2_common/pico_status_led/pioasm/src/pioasmBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
