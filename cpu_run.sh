if [ $# -eq 0 ];then
echo "usage:cpu_run.sh pid [sleep_time(1)]"
exit
fi
pid=$1

if [ $# -eq 2 ];then
sl_t=$2
else
sl_t=1
fi
while true
do
echo "---------------------(`date +%s`)--------------------"

	busybox awk '{printf("ut:%d,st:%d\n",$14,$15)}' //proc/$pid/stat
echo "-----------------------------------------------------"
for one_task in `ls /proc/$pid/task`;
do
	threadName=`busybox sed -n '1p' /proc/$pid/task/$one_task/status|busybox awk '{print $2}'`
	echo -n "\t---task:$one_task==>$threadName-->"

	busybox awk '{printf("ut:%d,st:%d\n",$14,$15)}' /proc/$pid/task/$one_task/stat
done
sleep $sl_t
echo "-----------------------------------------"

done
