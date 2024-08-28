/system script
add dont-require-permissions=no name=1stNeighborName owner=gollum policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    ":put [/ip neighbor get 0 identity]"
add dont-require-permissions=no name=1stNeighborUptime owner=gollum policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    ":put [/ip neighbor get 0 uptime]"
add dont-require-permissions=no name=1stNeighborMAC owner=gollum policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    ":put [/ip neighbor get 0 mac-address]"
add dont-require-permissions=no name=lteSessionUptime owner=gollum policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    ":put ([/interface/lte/monitor 0 as-value once]->\"session-uptime\")"
add dont-require-permissions=no name=ltePrimaryBand owner=gollum policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    ":put ([/interface/lte/monitor 0 as-value once]->\"primary-band\")"
add dont-require-permissions=no name=lteCaBand owner=gollum policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    ":put ([/interface/lte/monitor 0 as-value once]->\"ca-band\")"
