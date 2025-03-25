function Out-ARIReportResults {
    param (
        [string]$Measure,
        [string]$ResourcesCount,
        [string]$TotalRes,
        [string]$File,
        [string]$AdvisoryData,
        [string]$PolicyData,
        [string]$SecurityCenterData,
        [string]$DDFile,
        $SkipAdvisory,
        $SkipPolicy,
        $SecurityCenter,
        $SkipAPIs,
        $SkipDiagram
    )

    Write-Host ('Report Complete. Total Runtime was: ') -NoNewline -ForegroundColor Green
    Write-Host $Measure -ForegroundColor Cyan
    Write-Host ('Total Resources on Azure: ') -NoNewline
    Write-Host $ResourcesCount -ForegroundColor Cyan
    Write-Host ('Total Resources on Excel: ') -NoNewline
    Write-Host $TotalRes -ForegroundColor Cyan
    if (!$SkipAdvisory.IsPresent)
        {
            if(![string]::IsNullOrEmpty($AdvisoryData))
            {
                Write-Host ('Total Advisories: ') -NoNewline
                write-host $AdvisoryData -ForegroundColor Cyan
            }
        }
    if (!$SkipPolicy.IsPresent -and !$SkipAPIs.IsPresent)
        {
            if(![string]::IsNullOrEmpty($PolicyData))
                {
                    Write-Host ('Total Policies: ') -NoNewline
                    write-host $PolicyData -ForegroundColor Cyan
                }
        }
    if ($SecurityCenter.IsPresent)
        {
            if(![string]::IsNullOrEmpty($SecurityCenterData))
                {
                    Write-Host ('Total Security Advisories: ' + $SecurityCenterData)
                }
        }

    Write-Host ''
    Write-Host ('Excel file saved at: ') -NoNewline
    write-host $File -ForegroundColor Cyan
    Write-Host ''

    if(!$SkipDiagram.IsPresent)
        {
            Write-Host ('Draw.io Diagram file saved at: ') -NoNewline
            write-host $DDFile -ForegroundColor Cyan
            Write-Host ''
        }
}