# Minecraft-Server

My personalized Minecraft server docker-compose project.

Uses the [itzg/minecraft-server](https://hub.docker.com/r/itzg/minecraft-server) image.
Docs: [Github](https://github.com/itzg/docker-minecraft-server)

## Settings

All server settings are managed using environment variables in the docker-compose.yml file.

### Data Directories / Volumes

1. The world data is mapped to a named docker volume. **This is only necessary on windows and can be removed when running on linux.**

   This fixes a problem when running on Windows 11, see https://github.com/itzg/docker-minecraft-server/issues/1102 for updates.
   To access the data directory on Windows 11 navigate to `\\wsl.localhost\docker-desktop-data\version-pack-data\community\docker\volumes\minecraft-server_world\_data`.

2. The root data directory can be changed by replacing the first part of the volume binding in the docker-compose file.

   Per default, the data is stored at ./data in the project root.

```
    ...
    # replace './data' below with a different path
    volumes:
1->   - world:/data/world
2->   - ./data:/data

```

### OPs, Whitelist

Initial login GUIDs for OPs and whitelisted players can be added as a comma-separated list to the `OPS` and `WHITELIST` environment variables. Existing entries in the respective files are kept.

### Mods

Mods from [modrinth](https://modrinth.com) are automatically installed/updated. Enter a comma separated list of mod slugs (the URL-name of the mod) or Project IDs (bottom left on the modrinth mod page) in the MODRINTH_PROJECTS variable.

Currently the following mods are installed:

- [Fabric API](https://modrinth.com/mod/fabric-api)
- [Phosphor](https://modrinth.com/mod/phosphor)
- [Lithium](https://modrinth.com/mod/lithium)
- [Simple Voice Chat](https://modrinth.com/plugin/simple-voice-chat)
- [No Chat Reports](https://modrinth.com/mod/no-chat-reports)

### Vanilla Tweaks

Data packs from [vanilla tweaks](https://vanillatweaks.net) can be automatically downloaded. Select the data packs on vanilla tweaks click the Share button, copy the URL and then enter the part after the # in the VANILLATWEAKS_SHARECODE variable.

Currently the following packs are selected:

- Survival
  - multiplayer sleep
  - afk display
  - armor statues
- Items
  - player head drops
- Mobs
  - silence mobs
  - more mob heads
  - anti enderman grief
- Hermitcraft
  - wandering trades
- Quality-of-life
  - universal dyeing

### RCON-Password

The RCON password should be changed (or disable RCON by setting the ENABLE_RCON variable to false).

# Setup

## Docker

Docker & Docker-Compose has to be installed on the host system.
On a desktop OS, download [Docker Desktop](https://www.docker.com/products/docker-desktop/).
On Linux/Windows servers please look at the [docs](https://docs.docker.com/engine/install/) (don't forget the Compose plugin).

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
