$Env:CFG_FORWARDING_SECRET = "TEST";
docker compose -p minecraft pull
docker compose -p minecraft up -d --force-recreate --remove-orphans
