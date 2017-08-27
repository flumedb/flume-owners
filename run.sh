
#! /bin/bash

REPOS="
flumedb
flume-bench
flumecli
flumecodec
flumelog-idb
flumelog-level
flumelog-memory
flumelog-offset
flumeview-bloom
flumeview-hashtable
flumeview-idb
flumeview-level
flumeview-query
flumeview-reduce
test-flumelog
test-flumeview-index
"
AUTHORS="dominictarr regular"

for R in $REPOS; do
  OWNERS=$(npm owner ls $R | awk '{print $1}')
  for A in $AUTHORS; do
    echo $OWNERS | grep -o $A > /dev/null
    IS_OWNER=$?
    if [[ 0 == "$IS_OWNER" ]]; then 
      echo $A already owns $R
    else
      echo npm owner add $A $R
      npm owner add $A $R
    fi
  done
done










