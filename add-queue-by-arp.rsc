# 
# Create script for check how many apr in bridge "br-lan". Create Queue with 3xIPcount Mbit/s. Then run and remove script. 
#
/system script add name=q source=":local ipCount [/ip arp print count-only where interface=\"br-lan\" status=reachable]\r\n:local speed (\$ipCount*3000000)\r\n/queue simple add name=\"q-br-lan\" target=br-lan max-limit=\"\$speed/\$speed\""
/system script run q
/system script remove q
