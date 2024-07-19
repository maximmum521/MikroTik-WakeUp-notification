:delay 120s;
#####
# settings
#####
:local text "ROUTER WAKE UP";
:local Tag "Wake_Up"
/system script run ScriptSetings;
:global BotId;
:global ChatId;
:local Current [/system routerboard get current-firmware];
:local Upgrade [/system routerboard get upgrade-firmware];
:local Cheking [/system package update check-for-updates as-value];
:local CurrentVer ($Cheking -> "installed-version");
:local NewVer ($Cheking -> "latest-version");
######
/tool fetch url="https://api.telegram.org/bot$BotId/sendMessage\?chat_id=$ChatId&text=\
$[/system identity get name]\
%0a$[/system routerboard get model]\
%0a$[/system resource get board-name]\ 
%0aVersion $[/system routerboard get current-firmware]\
%0a$text\
%0a%23$Tag_$[/system identity get name]" keep-result=no;
