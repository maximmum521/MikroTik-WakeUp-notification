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
%0aBoard name $[/system resource get board-name]\ 
%0aVersion factory $[/system routerboard get factory-firmware]\
%0aVersion current  $[/system routerboard get current-firmware]\
%0aVersion upgrade $[/system routerboard get upgrade-firmware]\
%0a%23$Tag_$[/system identity get name]" keep-result=no;
