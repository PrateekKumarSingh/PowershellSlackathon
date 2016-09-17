<#
    From : Prateek Singh - @singhPrateik
#>

Function Get-Joke
{
    ((iwr -uri "http://tambal.azurewebsites.net/joke/random").content |Convertfrom-Json).joke
}

Get-Joke

<#

  PS C:\> Get-Joke
  
  Why did the fireman wear red, white, and blue suspenders? To hold his pants up.

  PS C:\> Get-Joke
    
  Why do mermaid wear sea-shells? Because b-shells are too small.

#>
