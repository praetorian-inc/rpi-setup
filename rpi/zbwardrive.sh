#!/bin/sh

PCAP_DIR=/tmp/pcaps
STDOUT_LOG=/tmp/zbout
STDERR_LOG=/tmp/zberr

(cd $PCAP_DIR && zbwardrive -s 2 -c 7 -v > $STDOUT_LOG 2> $STDERR_LOG)
