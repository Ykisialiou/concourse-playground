#!/bin/bash


if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

echo $TEST_KEY
