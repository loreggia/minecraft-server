Push-Location $PSScriptRoot;
Compress-Archive -Path "./data/*" -DestinationPath "backup-$(Get-Date -Format "yyyy-MM-dd-HH-mm-ss").zip"
Pop-Location;
