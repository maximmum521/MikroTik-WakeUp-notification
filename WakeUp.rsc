:log info "Run WakeUP script";
#####
# setings telegram boot
#####
:local BotId "***************";
:local ChatId "********";
#####
# CHECK ETHERNET FUNCTION
#####
:global funChekUP do={ 
:do { 
:delay 5;
:log info "ping google";
:local tmp;
:set $tmp [/ping google.com count=8];
:if ( $tmp > 4 ) do={
:log info "Ethernet UP";
} else={
:log info "Ethernet DOWN";
:delay 15;
$funChekUP;
} } on-error={ 
:log info "Failure";
:delay 15s;
$funChekUP;
} };
$funChekUP;
#####
:local text "ROUTER WAKE UP";
:local Tag "Wake_Up"
######
:log info "SEND MESSAGES";
/tool fetch url="https://api.telegram.org/bot$BotId/sendMessage\?chat_id=$ChatId&text=\
$text\
$[/system identity get name]\
\nModel $[/system routerboard get model]\
\nBoard-name $[/system resource get board-name]\ 
\nFactory-firmware $[/system routerboard get factory-firmware]\
\nCurrent-firmware  $[/system routerboard get current-firmware]\
\nUpgrade-firmware $[/system routerboard get upgrade-firmware]\
\n#$Tag #$[/system identity get name]" http-percent-encoding=yes keep-result=no;
