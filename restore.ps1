[CmdletBinding()]
param (
    # Specifies a path to one or more locations.
    [Parameter(Mandatory=$true,
               Position=0,
               ParameterSetName="Path",
               ValueFromPipeline=$true,
               ValueFromPipelineByPropertyName=$true,
               HelpMessage="Path to one or more locations.")]
    [Alias("PSPath")]
    [ValidateNotNullOrEmpty()]
    [string]
    $Path
)

Push-Location $PSScriptRoot;
Remove-Item -Path "./data-old" -Recurse -Force -ErrorAction SilentlyContinue;
Rename-Item -Path "data" -NewName "data-old";
Expand-Archive -Path $Path -DestinationPath "./data";
Pop-Location;
