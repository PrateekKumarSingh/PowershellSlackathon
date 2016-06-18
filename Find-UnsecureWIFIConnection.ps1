<#
  Script identifies any unEncrypted/ unsecure wifi connection that is in reach of your WiFi card.

  From : Prateek Singh - @singhPrateik
#>


Function Find-UnsecureWIFIConnection
{

    $data = (netsh wlan show networks mode=Bssid | ?{$_ -like "SSID*" -or $_ -like "*Authentication*" -or $_ -like "*Encryption*"}).trim()
    
    $result = For($i = 0;$i -lt $data.count;)
    {
        ''|Select @{n='Connection';e={($data[$i].split(':')[1]).trim()}}, @{n='Authentication';e={($data[$i+1].split(':')[1]).trim()}}, @{n='Encryption';e={($data[$i+2].split(':')[1]).trim()}}
        $i=$i+3
    }

    Return $result | ?{$_.encryption -like "*none*"}

}


<#
    PS C:\> Find-UnsecureWIFIConnection

    Connection     Authentication Encryption
    ----------     -------------- ----------
    D-Link_DIR-816 Open           None
    FVL-Guest      Open           None
#>
