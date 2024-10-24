Import-Module WindowsDisplayManager

$primaryDisplay = WindowsDisplayManager\GetPrimaryDisplay

$primaryDisplay.EnableHdr()
