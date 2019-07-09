#!/bin/bash

# 函数: CheckProcess
# 功能: 检查一个进程是否存在
# 参数: $1 --- 要检查的进程名称
# 返回: 如果存在返回0, 否则返回1.
#------------------------------------------------------------------------------
CheckProcess()
{
    # 检查输入的参数是否有效
    if [ "$1" = "" ];
    then
        return 1
    fi

    #$PROCESS_NUM获取指定进程名的数目，为1返回0，表示正常，不为1返回1，表示有错误，需要重新启动
    PROCESS_NUM=`ps -ef | grep "$1" | grep -v "grep" | wc -l` 
    if [ $PROCESS_NUM -eq 1 ];
    then
        return 0
    else
        return 1
    fi
}


# 检查test实例是否已经存在
PATH_SERVER="/skyworth/middle/bin/"
DBG_SERVER=${PATH_SERVER}"skydebugserver"
EVENT_SERVER=${PATH_SERVER}"skyemserver"
TV_SERVER=${PATH_SERVER}"tvserver"
DTV_SERVER=${PATH_SERVER}"dtvserver"
CI_SERVER=${PATH_SERVER}"ciserver"


while [ 1 ] ; do
    CheckProcess $DBG_SERVER
    Check_RET=$?
    if [ $Check_RET -eq 1 ];
    then
        echo "restart ${DBG_SERVER}"
        exec ${DBG_SERVER} &
    fi

    CheckProcess $EVENT_SERVER
    Check_RET=$?
    if [ $Check_RET -eq 1 ];
    then
        echo "restart ${EVENT_SERVER}"
        exec ${EVENT_SERVER} &
    fi

    CheckProcess $TV_SERVER
    Check_RET=$?
    if [ $Check_RET -eq 1 ];
    then
        echo "restart ${TV_SERVER}"
        exec ${TV_SERVER} &
    fi

    CheckProcess $DTV_SERVER
    Check_RET=$?
    if [ $Check_RET -eq 1 ];
    then
        echo "restart ${DTV_SERVER}"
        exec ${DTV_SERVER} &
    fi

    CheckProcess $CI_SERVER
    Check_RET=$?
    if [ $Check_RET -eq 1 ];
    then
        echo "restart ${CI_SERVER}"
        exec ${CI_SERVER} &
    fi

    sleep 1
done

