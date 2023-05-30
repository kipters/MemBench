#!/usr/bin/env bash
find binaries -name MemBench -exec echo "### {}" \; -exec /usr/bin/time -f "%E %M" {} ${1:-1000} \;
