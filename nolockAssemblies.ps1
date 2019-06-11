$Assemblies = @(
'System.Security.Principal'
)

foreach($Assembly in $Assemblies){

$ScriptBlock = {[System.Reflection.Assembly]::LoadWithPartialName($Assembly).Location}

$bytes = [System.IO.File]::ReadAllBytes((Invoke-Command -ScriptBlock $ScriptBlock))
[System.Reflection.Assembly]::Load($bytes)

}
