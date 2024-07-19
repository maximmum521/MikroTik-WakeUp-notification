# MikroTik Wake Up notification to Telegram

## Setings script
Change in ScriptSetings.rsc BotId, ChatId

```
:global BotId "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
:global ChatId "xxxxxx";
```

## Autostart
Run in console for add autostart
```
/system scheduler
```
```
add name=WakeUp on-event="/system script run WakeUp" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=start
```
