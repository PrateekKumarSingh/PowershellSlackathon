<# 
Function is capable to identify the Names and total numbers of Celebrities in a web hosted Image, Using Microsoft cognitive services (Computer Vision API)

From : Prateek Singh - @singhPrateik
#>
Function Get-Celebrity
{
[CmdletBinding()]

Param(
		[Parameter(ValueFromPipeline=$True)]
		[String] $URL
)

    Begin
    {
    }
    
    Process
    {
        Foreach($Item in $URL)
        {
    
            Try
            {
                $result = Invoke-RestMethod -Uri "https://api.projectoxford.ai/vision/v1.0/models/celebrities/analyze" `
                                            -Method 'Post' `
                                            -ContentType 'application/json' `
                                            -Body $(@{"URL"= $Url} | ConvertTo-Json) `
                                            -Headers @{'Ocp-Apim-Subscription-Key' = "YOUR SUBSCRIPTION KEY HERE"} `
                                            -ErrorVariable E

                $Celebs =  $result.result.celebrities.name

                ''|select @{n='Celebrities';e={$Celebs}}, @{n='Count';e={$Celebs.count}}, @{n='URL';e={$URL}}
            }
            Catch
            {
                ($E.errorrecord.ErrorDetails.Message -split '"')[-2]
            }
        }
    }

    End
    {
    }
}

<# Pass following Image URLs to Function 'Get-Celebrity' and subsequent output would be generated. PLEASE NOTE : You need subscribe and insert the API Key [on the line 25] to make this function work

(
 "http://az616578.vo.msecnd.net/files/2015/12/19/635861460485772096-652901092_selfieoscars.jpg", `
 "http://upload.wikimedia.org/wikipedia/commons/6/6c/Satya_Nadella.jpg", `
 "http://www.albawaba.com/sites/default/files/im/tom-hanks-circle.jpg", `
 "http://i.huffpost.com/gen/2018240/images/o-FRIENDS-SHOW-JENNIFER-ANISTON-facebook.jpg"
)| Get-Celebrity |ft * -AutoSize


Celebrities                                                    Count URL                                                                                         
-----------                                                    ----- ---                                                                                         
{Bradley Cooper, Ellen DeGeneres, Jennifer Lawrence}               3 http://az616578.vo.msecnd.net/files/2015/12/19/635861460485772096-652901092_selfieoscars.jpg
Satya Nadella                                                      1 http://upload.wikimedia.org/wikipedia/commons/6/6c/Satya_Nadella.jpg                        
Tom Hanks                                                          1 http://www.albawaba.com/sites/default/files/im/tom-hanks-circle.jpg                         
{David Schwimmer, Lisa Kudrow, Matthew Perry, Matt LeBlanc...}     5 http://i.huffpost.com/gen/2018240/images/o-FRIENDS-SHOW-JENNIFER-ANISTON-facebook.jpg 

#>
