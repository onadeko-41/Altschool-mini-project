#!/bin/bash
path=/home/admin/exercise-8/memory_logs/log_file.log

mail=hornadekor@gmail.com

date >> ${path}
echo " " >> ${path}
echo "Daily logs" >> ${path}
echo " " >> ${path}
echo "$(free)" >> ${path} | mutt -a ${path} -s "MEMORY LOGS" -- ${mail}
echo " " >> ${path}
echo " " >> ${path}
