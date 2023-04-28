#!/bin/bash

# return first nonzero error from PIPESTATUS
# usage check_pipestatus "${PIPESTATUS[@]}"
check_pipestatus() {
  local array=("$@")
  for a in "${array[@]}"; do
    if [ "$a" -ne 0 ]; then
      echo "ERROR: PIPE Error. Please do a trace and check individual pipe outputs" >&2
      return "$a"
    fi
  done
}
