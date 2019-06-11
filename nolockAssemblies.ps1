$Assemblies = @(
'System.Collections.Generic',
'System.Linq',
'System.Net',
'System.Net.NetworkInformation',
'System.Net.Sockets'
)

foreach($Assembly in $Assemblies){
    $ScriptBlock = {[System.Reflection.Assembly]::LoadWithPartialName($Assembly).Location}
    $bytes = [System.IO.File]::ReadAllBytes((Invoke-Command -ScriptBlock $ScriptBlock))
    [System.Reflection.Assembly]::Load($bytes)
}
