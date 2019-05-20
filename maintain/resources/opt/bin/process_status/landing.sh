#!/bin/sh

WORKER_DIR=$(PWD)/maintain/resources/opt/bin/process_status

read -p "input IP address：" IP

#check IP valid

echo "start to land $IP."
echo "exec $WORKER_DIR/check_process.sh"
ssh root@$IP < $WORKER_DIR/check_process.sh
#ssh root@$IP

read -p "input any key to quit " var
