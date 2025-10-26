# Windows metrics collector to CSV and/or Log Analytics (starter)
Param([string]$OutFile='windows_metrics.csv',[switch]$ToLogAnalytics)
$now = Get-Date
$cpu = (Get-Counter '\Processor(_Total)\% Processor Time' -SampleInterval 1 -MaxSamples 3).CounterSamples.CookedValue | Measure-Object -Average | Select-Object -ExpandProperty Average
$mem = Get-CimInstance Win32_OperatingSystem
$memPct = [math]::Round((1 - ($mem.FreePhysicalMemory/$mem.TotalVisibleMemorySize))*100,2)
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID,@{n='FreeGB';e={[math]::Round($_.FreeSpace/1GB,2)}}
$rows = @()
foreach ($d in $disk) { $rows += [pscustomobject]@{Timestamp=$now; CPU=$cpu; MemoryPct=$memPct; Disk=$d.DeviceID; FreeGB=$d.FreeGB} }
$exists = Test-Path $OutFile
$rows | Export-Csv -Path $OutFile -NoTypeInformation -Append:$exists
Write-Host "Wrote metrics to $OutFile" -ForegroundColor Green
