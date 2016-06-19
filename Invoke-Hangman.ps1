Function Invoke-Hangman
{

$Winner = @'
________________
   |         |
   |         |
   |        
   |        \0/
   |         |
___|____    //  ** You're the Saviour!

'@

$start = @'
________________
   |         |
   |         |
   |         
   |        
   |        
___|____

'@

$Attempt1= @'
________________
   |         |
   |         |
   |         0
   |        
   |        
___|____

'@

$Attempt2= @'
________________
   |         |
   |         |
   |         0
   |        /|\
   |         
___|____

'@

$Attempt3= @'
________________
   |         |
   |         |
   |         0
   |        /|\
   |        // 
___|____ ** You've Killed me stupid human !!

'@

$Attempt= @($Attempt1, $Attempt2, $Attempt3)

$Words = @{
            'Dolphin' = "D _ L _ _ I N"
            'Elephant' = "_ L _ P H _ _ T"
            'Kangroo' = "K _ _ G R _ _ "
            'Powershell' = "P _ W _ _ _ H _ L L"
        }

$Question  = $Words.GetEnumerator() |get-random
cls; $start
For($i=0;$i -lt 3;$i++)
{
Write-Host "Guess the word, this is your $($i+1)/3 attempt : $($Question.value)"
$answer = Read-Host "Your answer"

if($Question.name -eq $answer)
{
$Winner
}
else
{
    $Attempt[$i]
}

}

}
