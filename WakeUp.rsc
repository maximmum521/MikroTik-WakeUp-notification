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
%0a$[/system identity get name]\
%0aModel $[/system routerboard get model]\
%0aBoard-name $[/system resource get board-name]\ 
%0aFactory-firmware $[/system routerboard get factory-firmware]\
%0aCurrent-firmware  $[/system routerboard get current-firmware]\
%0aUpgrade-firmware $[/system routerboard get upgrade-firmware]\
%0a%23$Tag_$[/system identity get name]" http-percent-encoding=yes keep-result=no;
/system/script/environment/remove funChekUP;
