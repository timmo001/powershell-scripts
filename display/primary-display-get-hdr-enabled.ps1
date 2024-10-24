Import-Module WindowsDisplayManager

$primaryDisplay = WindowsDisplayManager\GetPrimaryDisplay

$primaryDisplay.HdrInfo.HdrEnabled
