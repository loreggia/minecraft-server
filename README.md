# Minecraft-Server

My personalized Minecraft server docker-compose project.

Uses the [itzg/minecraft-server](https://hub.docker.com/r/itzg/minecraft-server) image.
Docs: [Github](https://github.com/itzg/docker-minecraft-server)

# Setup

## Docker

Docker & Docker-Compose has to be installed on the host system.
On a desktop OS, download [Docker Desktop](https://www.docker.com/products/docker-desktop/).
On Linux/Windows servers please look at the [docs](https://docs.docker.com/engine/install/).

## Starting

Run `start.ps1` with PowerShell or `start.sh` in Bash or manually run

```
docker compose -p minecraft-server pull
docker compose -p minecraft-server up -d
```

in this directory.

## Stopping

Run `stop.ps1` with PowerShell or `stop.sh` in Bash or manually run

```
docker compose -p minecraft-server stop
```
