#!/bin/bash

# check if an element is in array ( no grep )
# usage: in_array "$needle" "${ARR[@]}"
in_array() {
  local needle=$1
  shift
  local array=("$@")

  for i in "${array[@]}"; do
    if [ "$i" == "$needle" ] ; then
      return 0 # bash success
    fi
  done
  return 1
}

# get the index of an element from an array
# usage: element_index=$(array_element_index "$element" "${ARR[@]}")
array_element_index() {
  local element=$1
  shift
  local array=("$@")
  for i in "${!array[@]}"; do
    if [ "${array[$i]}" == "${element}" ]; then
      echo "${i}";
    fi
  done
}

# pop last element from an array and shorten it\wiki\SC2178
# usage: last_element=$(array_pop [array_name])
# shellcheck disable=SC2178
array_pop() {
  local -n array=$1; shift
  if [ ${#array[@]} -ge 0 ]; then
   echo "${array[-1]}"
   unset "array[-1]"
  fi
}

# remove some elements from an array if exists without reindex
# usage: array_remove_elements [array_name] [element_1] [element2])
# shellcheck disable=SC2178
array_remove_elements() {
  local -n array=$1; shift
  local elements=("$@")
  for element in "${elements[@]}"; do
    for index in "${!array[@]}"; do
      if [ "${array[$index]}" == "${element}" ]; then
        unset "array[$index]"
      fi
    done
  done
}
