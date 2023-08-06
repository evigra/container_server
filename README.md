# CONTAINER

This repository contains the template to generate the containers

------------------

# GITHUB CONFIGURATION 

eval "$(ssh-agent -s)"; ssh-add ~/.ssh/developer



# DOCKER CONTAINER CONFIGURATIONS

sudo chown $(whoami):$(whoami) /var/run/docker.sock

# Create database container
docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=postgres -p 5432:5432  --name db postgres:13

# Create web container 
docker run -v ~/docker/container_server/addons:/mnt/extra-addons -v ~/docker/container_server/config/odoo.conf:/etc/odoo/odoo.conf -p 7916:8069 -p 7906:7906 --name server_16 --link db:db -t odoo:16.0

# Create database
docker exec -ti server_16 bash -c "/usr/bin/odoo -p 7906  -d server_16 --db_host db --db_port 5432 --db_user odoo --db_password odoo --without-demo all"



# Install modules
docker exec -ti server_16 bash -c "/usr/bin/odoo -i gpsmap_server -p 7906  -d server_16 --db_host db --db_port 5432 --db_user odoo --db_password odoo --without-demo all"

docker exec -ti server_16 bash -c "/usr/bin/odoo -i gpsmap_server -p 7906  -d server_16 --db_host db --db_port 5432 --db_user odoo --db_password odoo --without-demo all"
