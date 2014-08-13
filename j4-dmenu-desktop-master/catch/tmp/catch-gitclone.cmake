if("master" STREQUAL "")
  message(FATAL_ERROR "Tag for git checkout should not be empty.")
endif()

set(run 0)

if("/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch-stamp/catch-gitinfo.txt" IS_NEWER_THAN "/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch-stamp/catch-gitclone-lastrun.txt")
  set(run 1)
endif()

if(NOT run)
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch-stamp/catch-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch'")
endif()

execute_process(
  COMMAND "/usr/bin/git" clone "https://github.com/philsquared/Catch.git" "catch"
  WORKING_DIRECTORY "/home/marcov/.i3/j4-dmenu-desktop-master/catch/src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/philsquared/Catch.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git" checkout master
  WORKING_DIRECTORY "/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'master'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule init
  WORKING_DIRECTORY "/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to init submodules in: '/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule update --recursive
  WORKING_DIRECTORY "/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch-stamp/catch-gitinfo.txt"
    "/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch-stamp/catch-gitclone-lastrun.txt"
  WORKING_DIRECTORY "/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch-stamp/catch-gitclone-lastrun.txt'")
endif()

