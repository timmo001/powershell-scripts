Get-Module -Name WindowsDisplayManager -ListAvailable | Import-Module

$primaryDisplay = WindowsDisplayManager\GetPrimaryDisplay

$enabled = $primaryDisplay.HdrInfo.HdrEnabled

If ($enabled) {
    Write-Host "HDR is enabled on the primary display."
}
Else {
    Write-Host "HDR is not enabled on the primary display."

    # Prompt the user to enable HDR
    $prompt = "Would you like to enable HDR on the primary display?"
    $title = "Enable HDR?"
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Enable HDR on the primary display."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Do not enable HDR on the primary display."
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    $result = $host.ui.PromptForChoice($title, $prompt, $options, 0)

    If ($result -eq 0) {
        # Enable HDR
        $primaryDisplay.EnableHdr()
        Write-Host "HDR has been enabled on the primary display."
    }
    Else {
        Write-Host "HDR has not been enabled on the primary display."
    }

}
