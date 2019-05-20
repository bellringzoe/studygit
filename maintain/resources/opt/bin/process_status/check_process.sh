#!/bin/sh

WORK_DIR=/dev/shm

cd $WORK_DIR

echo "sampling..."
top -b -n 1 > sys_status.txt

echo -e "\033[7mcheck system CPU state                                                          \033[0m"
sed -n '/\%Cpu/p' sys_status.txt

echo -e "\033[7mcheck system mem state                                                          \033[0m"
sed -n '/KiB Mem/p' sys_status.txt

echo -e "\033[7mcheck the top 3 processes that cost CPU most                                    \033[0m"
#awk 'BEGIN {start=0} /PID/ || (start != 0  &&  NR > start && NR <= start + 3) { if(start == 0) start=NR;print $1,$9,$12}' sys_status.txt | tee -a cpu.txt
awk 'BEGIN {start=0;count=0} /PID/ || (start != 0  &&  NR > start && count < 3 && $12 != "top") {if(start == 0){start=NR}else{count++} printf("%-10s%-10s%-64s\n",$1,$9,$12)} ' sys_status.txt | tee -a cpu.txt
awk '(NR > 1){print $1}' cpu.txt | while read arg;do echo "pid $arg stack:";for((i = 0; i < 3; i++));do echo "sample stack $i";cat /proc/$arg/stack;done;done

echo -e "\033[7mcheck the top 3 processes that cost memory most                                  \033[0m"
top -b -n 1 -o %MEM  > sys_status1.txt
awk 'BEGIN {start=0} /PID/ || (start != 0  &&  NR > start && NR <= start + 3) {if(start == 0)start=NR;printf("%-10s%-10s%-10s%-10s%-64s\n" ,$1,$5,$6,$10,$12)}' sys_status1.txt 

echo -e "\033[7mcheck if D state processes exist                                                 \033[0m"
#awk 'BEGIN {start=0} /PID/ || (start != 0  &&  NR > start) {if(start == 0)start=NR; if($8 == "STAT" || $8 ~/D/ ||$8 ~/Z/)print $2,$3,$4,$8,$11}' sys_status1.txt
awk 'BEGIN {start=0;d_count=0} /PID/||(start != 0 && NR > start){if(start == 0)start=NR;if($8 == "PID")print $1,$8,$5,$6,$9,$10,$12;if($8 ~/D/){print $1,$8,$5,$6,$9,$10,$12;d_count++;}} END{print "D_state process:",d_count}' sys_status1.txt | tee -a d_process.txt
awk '(NR > 1 && !/D_state/){print $1}' d_process.txt | while read arg;do echo "pid $arg stack:";cat /proc/$arg/stack;done

echo -e "\033[7mcheck if Z state processes exist                                                 \033[0m"
awk 'BEGIN {start=0;z_count=0} /PID/||(start != 0 && NR > start){if(start == 0)start=NR;if($1 == "PID")print $1,$8,$5,$6,$9,$10,$12;if($8 ~/Z/){print $1,$8,$5,$6,$9,$10,$12;z_count++;}} END{print "zombies process:",z_count}' sys_status1.txt | tee -a z_process.txt
echo "checking the zombies process's threads"
awk '(NR > 1 && !/zombies/){print $1}' z_process.txt | while read arg;do top -b -n 1 -H -p $arg | sed -n '7,$p' ;done
#awk '(NR > 1 && !/zombies/){print $1}' z_process.txt | while read arg;do ps -p $arg -fL ;done

echo -e "\033[7mcheck if coredump file has been generated                                        \033[0m"
for((i=1;i >0;i--))
do 
   var=$(cat /proc/sys/kernel/core_pattern)
   var1=${var%/*}
   ls -l $var1
done

rm $WORK_DIR/cpu.txt
rm $WORK_DIR/d_process.txt
rm $WORK_DIR/z_process.txt

echo "finished"



