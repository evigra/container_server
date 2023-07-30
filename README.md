# CONTAINER

This repository contains the template to generate the containers

------------------

## CONFIGURATION 

# Permitions container
sudo chmod 666 /var/run/docker.sock

# Create container
docker-compose up

# Restart container
docker-compose restart

# Stop container
docker-compose stop

# Install modules
docker exec -it container_server_web_1 bash -c "odoo -p 7906 -i gpsmap_server -d server_16 --db_host db --db_port 5432 --db_user odoo --db_password odoo"

docker exec -it container_server_web_1 bash -c "odoo -p 7906 -u gpsmap_server -d server_16 --db_host db --db_port 5432 --db_user odoo --db_password odoo"



