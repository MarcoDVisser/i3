

set(ENV{VS_UNICODE_OUTPUT} "")
set(command "/usr/bin/cmake;-P;/home/marcov/.i3/j4-dmenu-desktop-master/catch/tmp/catch-gitclone.cmake")
execute_process(
  COMMAND ${command}
  RESULT_VARIABLE result
  OUTPUT_FILE "/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch-stamp/catch-download-out.log"
  ERROR_FILE "/home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch-stamp/catch-download-err.log"
  )
if(result)
  set(msg "Command failed: ${result}\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach(arg)
  set(msg "${msg}\nSee also\n  /home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch-stamp/catch-download-*.log\n")
  message(FATAL_ERROR "${msg}")
else()
  set(msg "catch download command succeeded.  See also /home/marcov/.i3/j4-dmenu-desktop-master/catch/src/catch-stamp/catch-download-*.log\n")
  message(STATUS "${msg}")
endif()
