<# 
Function identify Adult/Racy content on web hosted Images, Using Microsoft cognitive services (Computer Vision API)
Go to the Following link and subscribe a Key for COMPUTER VISION API and paste it [Line 33] against 'Ocp-Apim-Subscription-Key' = "YOUR SUBSCRIPTION KEY GOES HERE"

SUBSCRIPTION LINK - https://www.microsoft.com/cognitive-services/en-US/subscriptions

From : Prateek Singh - @singhPrateik
This function is part of my PowerShell module of Microsoft Congnitive services I'm already working on. More Fun to come :)
#>

Function Test-AdultContent
{
[CmdletBinding()]
Param(
		[Parameter(ValueFromPipeline=$True)]
		[String] $URL
)

    Begin
    {    }
    
    Process
    {
        Foreach($Item in $URL)
        {
    
            Try
            {
                $result = Invoke-RestMethod -Uri "https://api.projectoxford.ai/vision/v1.0/analyze?visualFeatures=Adult" `
                                            -Method 'Post' `
                                            -ContentType 'application/json' `
                                            -Body $(@{"URL"= $URL} | ConvertTo-Json) `
                                            -Headers @{'Ocp-Apim-Subscription-Key' = "YOUR SUBSCRIPTION KEY GOES HERE"} `
                                            -ErrorVariable E

                $result.adult | select IsAdultContent, isRacyContent, @{n='URL';e={$Item}}
            }
            Catch
            {
                Write-Error ($E.errorrecord.ErrorDetails.Message -split '"')[-2]
            }
        }
    }

    End
    {    }
}

<# 

For Example - I can quickly scan Images hosted on my blog's homepage. Luckily it came out clean. LOL!

PS C:\> (iwr -Uri 'http:\\geekeefy.wordpress.com' -UseBasicParsing).images.src | Test-AdultContent -ErrorAction SilentlyContinue

isAdultContent isRacyContent URL                                                                                      
-------------- ------------- ---                                                                                      
         False         False https://geekeefy.files.wordpress.com/2016/06/windowserror1.gif?w=900&amp;h=300&amp;crop=1
         False         False https://geekeefy.files.wordpress.com/2016/06/gist3.png?w=711&amp;h=133&amp;crop=1        
         False         False https://geekeefy.files.wordpress.com/2016/05/ezgif-com-video-to-gif-11.gif?w=900&amp;h...
         False         False https://geekeefy.files.wordpress.com/2016/05/4.gif?w=900&amp;h=300&amp;crop=1            
         False         False https://geekeefy.files.wordpress.com/2016/04/ezgif-com-optimize1.gif?w=900&amp;h=300&a...
         False         False https://geekeefy.files.wordpress.com/2016/03/ezgif-com-video-to-gif-2.gif?w=786&amp;h=...
         False         False https://geekeefy.files.wordpress.com/2016/03/featured.gif?w=806&amp;h=286&amp;crop=1     
         False         False https://secure.gravatar.com/avatar/2b2f100e9097063a5777a26820a58fc7?s=320 

Also, you can pass an array of Image URL's to scan for any Adult content.

C:\> @(
	"http://az616578.vo.msecnd.net/files/2015/12/19/635861460485772096-652901092_selfieoscars.jpg", `
    "http://upload.wikimedia.org/wikipedia/commons/6/6c/Satya_Nadella.jpg", `
    "http://img2.tvtome.com/i/u/aa0f2214136945d8c57879a5166c4271.jpg", `
    "http://www.newstatesman.com/sites/default/files/images/2014%2B36_Friends_Cast_Poker(1).jpg", `
    "http://i.huffpost.com/gen/2018240/images/o-FRIENDS-SHOW-JENNIFER-ANISTON-facebook.jpg", `
    "http://img01.thedrum.com/s3fs-public/styles/news_article_lightbox/public/news/tmp/103031/nrm_1418898205-cosmopolitan_february_cover.jpg?itok=2b0rU0Db"
) | Test-AdultContent |ft * -AutoSize

isAdultContent isRacyContent URL                                                                                                                                                
-------------- ------------- ---                                                                                                                                                
         False         False http://az616578.vo.msecnd.net/files/2015/12/19/635861460485772096-652901092_selfieoscars.jpg                                                       
         False         False http://upload.wikimedia.org/wikipedia/commons/6/6c/Satya_Nadella.jpg                                                                               
         False         False http://img2.tvtome.com/i/u/aa0f2214136945d8c57879a5166c4271.jpg                                                                                    
         False         False http://www.newstatesman.com/sites/default/files/images/2014%2B36_Friends_Cast_Poker(1).jpg                                                         
         False         False http://i.huffpost.com/gen/2018240/images/o-FRIENDS-SHOW-JENNIFER-ANISTON-facebook.jpg                                                              
         False         False http://img01.thedrum.com/s3fs-public/styles/news_article_lightbox/public/news/tmp/103031/nrm_1418898205-cosmopolitan_february_cover.jpg?itok=2b0
#>

