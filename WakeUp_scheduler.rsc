/system scheduler
add name=WakeUp on-event="/system/script run WakeUp" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup