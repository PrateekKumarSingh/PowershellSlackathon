<# 
Use this function to get Random background in PowerShell host. Works well with both Console and ISE host.
And is one of the most useless piece of **code** I've Ever written :D :P 

Apart from splash of colors - This fucntion plays music notes (Using Leon Bambrick's Play-Note Function) when used with '-DanceFloorMode' switch.

From : Prateek Singh - @singhPrateik
#>

Function Set-RandomBackground
{
    [Cmdletbinding()]    
    Param
    (
        [Switch] $DanceFloorMode,
        [switch] $DefaultBackground
    )
    
    $OldErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference ='SilentlyContinue'

    $ColorHash = @{
    15='White'       
    14='Yellow'      
    13='Magenta'     
    12='Red'         
    11='Cyan'        
    10='Green'       
    9 ='Blue'        
    8 ='DarkGray'    
    7 ='Gray'        
    6 ='DarkYellow'    
    5 ='DarkMagenta'    
    4 ='DarkRed'     
    3 ='DarkCyan'    
    2 ='DarkGreen'    
    1 ='DarkBlue'    
    0 ='Black'       
    }

    If($DanceFloorMode)
    {
        Start-Job -Name DanceFloorMode -ScriptBlock{

#region LeonBambrick's code
        $notes = @{};
        $notes["C0"] = 8.175798916;
        $notes["Db0"] = 8.661957218;
        $notes["D0"] = 9.177023997;
        $notes["Eb0"] = 9.722718241; 
        $notes["E0"] = 10.30086115 ;
        $notes["F0"] = 10.91338223 ;
        $notes["Gb0"] = 11.56232571; 
        $notes["G0"] = 12.24985737 ;
        $notes["Ab0"] = 12.9782718 ;
        $notes["A0"] = 13.75       ;
        $notes["Bb0"] = 14.56761755; 
        $notes["B0"] = 15.43385316 ;
        $notes["C1"] = 16.35159783 ;
        $notes["Db1"] = 17.32391444; 
        $notes["D1"] = 18.35404799 ;
        $notes["Eb1"] = 19.44543648; 
        $notes["E1"] = 20.60172231 ;
        $notes["F1"] = 21.82676446 ;
        $notes["Gb1"] = 23.12465142; 
        $notes["G1"] = 24.49971475 ;
        $notes["Ab1"] = 25.9565436 ;
        $notes["A1"] = 27.5        ;
        $notes["Bb1"] = 29.13523509; 
        $notes["B1"] = 30.86770633 ;
        $notes["C2"] = 32.70319566 ;
        $notes["Db2"] = 34.64782887; 
        $notes["D2"] = 36.70809599 ;
        $notes["Eb2"] = 38.89087297; 
        $notes["E2"] = 41.20344461 ;
        $notes["F2"] = 43.65352893 ;
        $notes["Gb2"] = 46.24930284; 
        $notes["G2"] = 48.9994295  ;
        $notes["Ab2"] = 51.9130872 ;
        $notes["A2"] = 55          ;
        $notes["Bb2"] = 58.27047019; 
        $notes["B2"] = 61.73541266 ;
        $notes["C3"] = 65.40639133 ;
        $notes["Db3"] = 69.29565774; 
        $notes["D3"] = 73.41619198 ;
        $notes["Eb3"] = 77.78174593; 
        $notes["E3"] = 82.40688923 ;
        $notes["F3"] = 87.30705786 ;
        $notes["Gb3"] = 92.49860568; 
        $notes["G3"] = 97.998859   ;
        $notes["Ab3"] = 103.8261744; 
        $notes["A3"] = 110         ;
        $notes["Bb3"] = 116.5409404; 
        $notes["B3"] = 123.4708253 ;
        $notes["C4"] = 130.8127827 ;
        $notes["Db4"] = 138.5913155; 
        $notes["D4"] = 146.832384  ;
        $notes["Eb4"] = 155.5634919; 
        $notes["E4"] = 164.8137785 ;
        $notes["F4"] = 174.6141157 ;
        $notes["Gb4"] = 184.9972114; 
        $notes["G4"] = 195.997718  ;
        $notes["Ab4"] = 207.6523488; 
        $notes["A4"] = 220   ;
        $notes["Bb4"] = 233.0818808; 
        $notes["B4"] = 246.9416506 ;
        $notes["C5"] = 261.6255653 ;
        $notes["Db5"] = 277.182631 ;
        $notes["D5"] = 293.6647679 ;
        $notes["Eb5"] = 311.1269837; 
        $notes["E5"] = 329.6275569 ;
        $notes["F5"] = 349.2282314 ;
        $notes["Gb5"] = 369.9944227; 
        $notes["G5"] = 391.995436  ;
        $notes["Ab5"] = 415.3046976; 
        $notes["A5"] = 440         ;
        $notes["Bb5"] = 466.1637615; 
        $notes["B5"] = 493.8833013 ;
        $notes["C6"] = 523.2511306 ;
        $notes["Db6"] = 554.365262 ;
        $notes["D6"] = 587.3295358 ;
        $notes["Eb6"] = 622.2539674; 
        $notes["E6"] = 659.2551138 ;
        $notes["F6"] = 698.4564629 ;
        $notes["Gb6"] = 739.9888454; 
        $notes["G6"] = 783.990872  ;
        $notes["Ab6"] = 830.6093952; 
        $notes["A6"] = 880         ;
        $notes["Bb6"] = 932.327523 ;
        $notes["B6"] = 987.7666025 ;
        $notes["C7"] = 1046.502261 ;
        $notes["Db7"] = 1108.730524; 
        $notes["D7"] = 1174.659072 ;
        $notes["Eb7"] = 1244.507935; 
        $notes["E7"] = 1318.510228 ;
        $notes["F7"] = 1396.912926 ;
        $notes["Gb7"] = 1479.977691; 
        $notes["G7"] = 1567.981744 ;
        $notes["Ab7"] = 1661.21879 ;
        $notes["A7"] = 1760        ;
        $notes["Bb7"] = 1864.655046; 
        $notes["B7"] = 1975.533205 ;
        $notes["C8"] = 2093.004522 ;
        $notes["Db8"] = 2217.461048; 
        $notes["D8"] = 2349.318143 ;
        $notes["Eb8"] = 2489.01587 ;
        $notes["E8"] = 2637.020455 ;
        $notes["F8"] = 2793.825851 ;
        $notes["Gb8"] = 2959.955382; 
        $notes["G8"] = 3135.963488 ;
        $notes["Ab8"] = 3322.437581; 
        $notes["A8"] = 3520        ;
        $notes["Bb8"] = 3729.310092; 
        $notes["B8"] = 3951.06641  ;
        $notes["C9"] = 4186.009045 ;
        $notes["Db9"] = 4434.922096; 
        $notes["D9"] = 4698.636287 ;
        $notes["Eb9"] = 4978.03174 ;
        $notes["E9"] = 5274.040911 ;
        $notes["F9"] = 5587.651703 ;
        $notes["Gb9"] = 5919.910763; 
        $notes["G9"] = 6271.926976 ;
        $notes["Ab9"] = 6644.875161; 
        $notes["A9"] = 7040        ;
        $notes["Bb9"] = 7458.620184; 
        $notes["B9"] = 7902.13282  ;
        $notes["C10"] = 8372.01809 ;
        $notes["Db10"] = 8869.844191; 
        $notes["D10"] = 9397.272573 ;
        $notes["Eb10"] = 9956.063479; 
        $notes["E10"] = 10548.08182 ;
        $notes["F10"] = 11175.30341 ;
        $notes["Gb10"] = 11839.82153; 
        $notes["G10"] = 12543.85395 ;
        
        function play-tone($note)
        {
        
        	# a default speed. but any note that includes a speed part will override this.
        	$duration = 200;
        	# read the pipeline, just in case...
        	foreach($n in $input)
        	{ 
        		# $synth.speak($n);
            
        		$n0 = $n.split(":")[0];
        		$n1 = $n.split(":")[1];
        		if($n1 -eq $null)
        		{ $n1 = $duration }
        
        		[console]::beep($notes[$n0],$n1);
        	}
        
        }
        
        "E6:250","E6:250","D6:250","E6:500","B5:500","Bb5:500","A5:500","E5:250","G5:500","e5:500",`
        "E6:250","E6:250","D6:250","E6:500","B5:500","Bb5:500","A5:500","E5:250","G5:500","E5:500" |play-tone
#endregion
        
        } |Out-Null #End : Start-Job
        
        $InitialBGColor = $Host.UI.RawUI.BackgroundColor.value__
        15..0 |`
        %{
            If($Host.name -like "*ise*")
            {
                $Host.PrivateData.ErrorBackgroundColor = $ColorHash[$PSItem]
                $Host.PrivateData.WarningBackgroundColor = $ColorHash[$PSItem]
                $Host.PrivateData.VerboseBackgroundColor = $ColorHash[$PSItem]
                $Host.PrivateData.DebugBackgroundColor = $ColorHash[$PSItem]
                $Host.PrivateData.ConsolePaneBackgroundColor = $ColorHash[$PSItem]
                $Host.PrivateData.ConsolePaneTextBackgroundColor = $ColorHash[$PSItem]
            }
            else
            {
                $Host.UI.RawUI.BackgroundColor = $PSItem
            }
            cls
            Start-Sleep -Milliseconds 500
        }

        cls
    }
    elseif($DefaultBackground)
    {
            If($Host.name -like "*ise*")
            {
                $Host.PrivateData.ErrorBackgroundColor = 'DarkBlue'
                $Host.PrivateData.WarningBackgroundColor = 'DarkBlue'
                $Host.PrivateData.VerboseBackgroundColor = 'DarkBlue'
                $Host.PrivateData.DebugBackgroundColor = 'DarkBlue'
                $Host.PrivateData.ConsolePaneBackgroundColor = 'DarkBlue'
                $Host.PrivateData.ConsolePaneTextBackgroundColor = 'DarkBlue'
            }
            else
            {
                $Host.UI.RawUI.BackgroundColor = 1
            }
        cls
    }
    else
    {
         $Random = Get-Random -Minimum 0 -Maximum 15
            
            If($Host.name -like "*ise*")
            {
                $Host.PrivateData.ErrorBackgroundColor = $ColorHash[$Random]
                $Host.PrivateData.WarningBackgroundColor = $ColorHash[$Random]
                $Host.PrivateData.VerboseBackgroundColor = $ColorHash[$Random]
                $Host.PrivateData.DebugBackgroundColor = $ColorHash[$Random]
                $Host.PrivateData.ConsolePaneBackgroundColor = $ColorHash[$Random]
                $Host.PrivateData.ConsolePaneTextBackgroundColor = $ColorHash[$Random]
            }
            else
            {
                $Host.UI.RawUI.BackgroundColor = $Random
            }
         cls
    }
$ErrorActionPreference = $OldErrorActionPreference

}

<#
   #To set random background
    
     Set-RandomBackground

   #To switch to defaults and save Screwing up your shell theme
     
     Set-RandomBackground -DefaultBackground

   #Splash of many random colors on your screen, with notes getting played in background.
     
     Set-RandomBackground -DanceFloorMode
#>

