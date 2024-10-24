Get-Module -Name WindowsDisplayManager -ListAvailable | Import-Module

$primaryDisplay = WindowsDisplayManager\GetPrimaryDisplay

$primaryDisplay.DisableHdr()
