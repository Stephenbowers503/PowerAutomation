 $host.ui.RawUI.WindowTitle = “CS Socwatch KPI USB Control Window”
 python "C:\python36\lib\site-packages\evtar\maple\workloads\CS\Unplug_USB.pyw"
 
 $notpressed = $true

 ########### Enter Duration of unplug here ###########
 $Duration = 930

 $i = 0
 $b = 0
 $c = 0

 while($notpressed){
    $i++
    $c = ([Math]::Round((($i/$Duration) * 100),0))
     if([console]::KeyAvailable)
     {
         $notpressed = $false    
     }    
     else{

         if($i -le $Duration)
         {   
            
             Write-Progress -Activity "CS in Progress: Press any key to abort ..." -Status "$c%" -PercentComplete "$c" -SecondsRemaining ($Duration - $i)
             Start-Sleep -Milliseconds 1000 
             
         }
         if($c -ge 100)
         {
             Break
         }
     }
 }
Echo "Re-establishing the P2P Connection to DUT ..."
python "C:\python36\lib\site-packages\evtar\maple\workloads\CS\Plug_In_USB.pyw"
for($b = 0; $b -ne 100; $b++)
         {
             Write-Progress -Activity "Reconnecting USB ..." -Status "$b% Complete:" -PercentComplete $b
             Start-Sleep -Milliseconds 50
         }




# If you want to have an audible que that the usb is being plugged in uncomment next 3 lines.
#Add-Type -AssemblyName System.speech
#$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
#$speak.Speak('The P2P Connection Has Been Restored')

exit