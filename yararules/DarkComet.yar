rule DarkComet
{
￼￼meta:
description = "DarkComet RAT"
author = "Fidelis Cybersecurity"
reference = "Fidelis Threat Advisory #1018 - Looking at the Sky for a DarkComet - August 4, 2015"
date = "2015-07-22" 

strings:
$s1 = "#KCMDDC"
$s2 = "DCDATA"
$s3 = "#BOT#CloseServer" 
$s4 = "#BOT#SvrUninstall"
$s5 = "#BOT#URLDownload" condition:
uint16(0) == 0x5a4d and filesize < 50MB and all of ($s*)
}

rule DarkCometDownloader {
meta:
description = "DarkComet RAT Downloader" 
author = "Fidelis Cybersecurity"
reference = "Fidelis Threat Advisory #1018 - Looking at the Sky for a DarkComet - August 4, 2015"
date = "2015-07-22"

strings:
$s1 = {6A00FF15F0304000A30D1040006A0A68261040006A00FF15F4304000A311104000FF 35111040006A00FF15F8304000A315104000FF35111040006A00FF15FC304000A3191 04000FF3515104000FF1500314000A31D104000FF3519104000FF351D104000682C11 4000FF1508314000FF3515104000FF150C31400031C0682C104000682C104000FF151 43140006805104000682C104000FF1510314000682C104000FF15183140006A006A00 682C104000682C1140006A00FF15803040006A056A006A00682C10400068001040006 A00FF15A83040006A00FF1504314000}
condition:
uint16(0) == 0x5a4d and filesize < 10KB and all of them
}