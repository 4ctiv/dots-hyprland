function check-app-debug -d "GDB debugging executable"
 set -l help_message "
  Debug an executable using GDB with TUI interface

  Usage:
      app-debug [-h|--help] <executable> [<flags>...]

  Arguments:
      executable     Path to the executable to debug
      flags          Additional GDB flags

  Options:
      -h|--help      Show this help message

  Returns:
      0             Success
      1             Error occurred
      2             Invalid arguments

  Common GDB Commands:
      file          Set file to debug (set to passed arg)
      break <func>  Set breakpoint at function
      info break    View breakpoints
      disable <id>  Disable specific breakpoint by ID
      run           Start debugging
      continue      Run till next breakpoint/End
      next          Step to next line
      nexti         Step to next Assembly
      step          Step into function
      continue      Continue execution
      print <var>   Print variable value
      backtrace     Show call stack
      quit          Exit GDB
  "

  # Check required argument
  if not set -q argv[1]
    echo "[ERROR] No executable provided"
    return 2
  end

  # Validate executable exists
  set app "$argv[1]"
  if not test -f "$app"
    if not test -f "$(which $app)"
      echo "[ERROR] '$app' is not a valid file or program"
      return 2
    end
    set app "$(which "$app")"
  end

  # Display file information
  file "$app"

  # Start GDB with TUI interface
 #gdb -tui -g "$app" ||\
  gdb -tui "$app"
 #coredumpctl gdb "$app" # Run gdb on last $app crash

  # GDB Commands Quck Start
  #1) `break main`
  #2) `run`
  #3.1) `next` (line) `nexti` (assembly)
  #3.2) `step` (jump over)
  #3.3) `ref` (refresh ui)
  #4) `backtrace 10` `shell clear` (clear history) `p` (see values)
  #5) `up` (move back backtrace) `down` (move forward backtrace)

end
