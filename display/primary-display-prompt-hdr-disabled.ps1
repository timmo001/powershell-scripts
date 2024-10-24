Get-Module -Name WindowsDisplayManager -ListAvailable | Import-Module

$primaryDisplay = WindowsDisplayManager\GetPrimaryDisplay

$enabled = $primaryDisplay.HdrInfo.HdrEnabled

If ($enabled) {
    Write-Host "HDR is enabled on the primary display."

    # Prompt the user to disable HDR
    $prompt = "Would you like to disable HDR on the primary display?"
    $title = "Disable HDR?"
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Disable HDR on the primary display."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Do not disable HDR on the primary display."
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    $result = $host.ui.PromptForChoice($title, $prompt, $options, 0)

    If ($result -eq 0) {
        # Disable HDR
        $primaryDisplay.DisableHdr()
        Write-Host "HDR has been disabled on the primary display."
    }
    Else {
        Write-Host "HDR has not been disabled on the primary display."
    }
}
Else {
    Write-Host "HDR is not enabled on the primary display."
}
