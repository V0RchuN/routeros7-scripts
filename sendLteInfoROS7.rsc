system scheduler add interval=1m name=sendLteInfoScript on-event=sendLteInfo start-time=startup
system script add name="sendLteInfo" source="local lteinfo [/interface/lte/monitor 0 once as-value]\
    \nlocal lteuptime (\$lteinfo->\"session-uptime\")\
    \nlocal lteimei (\$lteinfo->\"imei\")\
    \nlocal ltersrp (\$lteinfo->\"rsrp\")\
    \nlocal ltesinr (\$lteinfo->\"sinr\")\
    \nlocal ltersrq (\$lteinfo->\"rsrq\")\
    \nlocal lteuicc (\$lteinfo->\"uicc\")\
    \nlocal hostname [/system/identity/get name]\
    \nlocal hexname [/ip/neighbor/get 0 identity]\
    \nlocal hexEther [/ip/neighbor/get 0 interface-name]\
    \nlocal hexUptime [/ip/neighbor/get 0 uptime]\
    \nlocal hexMac [/ip/neighbor/get 0 mac-address]\
    \ntool fetch url=\"https://dweet.io/dweet/for/\$hexname\\\?lteuptime=\$lteuptime&imei=\$lteimei\
	&simcard=s\$lteuicc&rsrq=\$ltersrq&rsrp=\$ltersrp&sinr=\$ltesinr&ltename=\$hostname&hexEther=\$hexEther&hexMac=\$he\
    xMac&hexUptime=\$hexUptime\" keep-result=no"
system scheduler print
system script run sendLteInfo
