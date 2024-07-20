:delay 120;
#####
:local text "ROUTER WAKE UP";
:local Tag "Wake_Up"
/system script run ScriptSetings;
:global BotId;
:global ChatId;
######
/tool fetch url="https://api.telegram.org/bot$BotId/sendMessage\?chat_id=$ChatId&text=\
$text\
%0a$[/system identity get name]\
%0aModel $[/system routerboard get model]\
%0aBoard-name $[/system resource get board-name]\ 
%0aSerial-number $[/system routerboard get serial-number]\
%0aFactory-firmware $[/system routerboard get factory-firmware]\
%0aCurrent-firmware  $[/system routerboard get current-firmware]\
%0aUpgrade-firmware $[/system routerboard get upgrade-firmware]\
%0a%23$Tag_$[/system identity get name]" keep-result=no;
