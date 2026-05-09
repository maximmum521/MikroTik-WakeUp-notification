/system script
add dont-require-permissions=no name=WakeUp owner=404NotFound policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    log info \"Run WakeUP script\";\
    \n#####\
    \n# setings telegram boot\
    \n#####\
    \n:local BotId \"1654708951:AAGwwuzZKQnn-khZJOLpF4QqlCyi5PIJ6dQ\";\
    \n:local ChatId \"352670694\";\
    \n#####\
    \n# CHECK ETHERNET FUNCTION\
    \n#####\
    \n:global funChekUP do={ \
    \n:do { \
    \n:delay 5;\
    \n:log info \"ping google\";\
    \n:local tmp;\
    \n:set \$tmp [/ping google.com count=8];\
    \n:if ( \$tmp > 4 ) do={\
    \n:log info \"Ethernet UP\";\
    \n} else={\
    \n:log info \"Ethernet DOWN\";\
    \n:delay 15;\
    \n\$funChekUP;\
    \n} } on-error={ \
    \n:log info \"Failure\";\
    \n:delay 15s;\
    \n\$funChekUP;\
    \n} };\
    \n\$funChekUP;\
    \n#####\
    \n:local text \"ROUTER WAKE UP\";\
    \n:local Tag \"Wake_Up\"\
    \n######\
    \n:log info \"SEND MESSAGES\";\
    \n/tool fetch url=\"https://api.telegram.org/bot\$BotId/sendMessage\\\?cha\
    t_id=\$ChatId&text=\\\
    \n\$text\\\
    \n%0a\$[/system identity get name]\\\
    \n%0aModel \$[/system routerboard get model]\\\
    \n%0aBoard-name \$[/system resource get board-name]\\ \
    \n%0aFactory-firmware \$[/system routerboard get factory-firmware]\\\
    \n%0aCurrent-firmware  \$[/system routerboard get current-firmware]\\\
    \n%0aUpgrade-firmware \$[/system routerboard get upgrade-firmware]\\\
    \n%0a%23\$Tag_\$[/system identity get name]\" keep-result=no;\
    \n/system/script/environment/remove funChekUP;"
/system scheduler
add name=WakeUp on-event="/system/script run WakeUp" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
