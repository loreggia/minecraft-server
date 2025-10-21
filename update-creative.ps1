$ErrorActionPreference = "Stop";

$execCompose = "docker compose -p minecraft"

Write-Output "Backing up mc-survival";
iex "$execCompose exec mc-survival-backup backup now"
Write-Output "Backing up mc-creative";
iex "$execCompose exec mc-creative-backup backup now"

Write-Output "Stopping mc-creative";
iex "$execCompose stop mc-creative"

if (Test-Path "./data/creative") {
    Write-Output "Removing mc-creative data";
    Remove-Item ./data/creative/* -Recurse -Force
}

Write-Output "Creating mc-survival-to-creative-restore";
iex "$execCompose create mc-survival-to-creative-restore --scale mc-survival-to-creative-restore=1"

Write-Output "Starting mc-survival-to-creative-restore";
iex "$execCompose start mc-survival-to-creative-restore"

Write-Output "Waiting for mc-survival-to-creative-restore";
iex "$execCompose wait mc-survival-to-creative-restore"

Write-Output "Removing mc-survival-to-creative-restore";
iex "$execCompose create --scale mc-survival-to-creative-restore=0"

Write-Output "Starting mc-creative";
iex "$execCompose start mc-creative"
