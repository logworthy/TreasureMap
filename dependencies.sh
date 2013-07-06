#! /bin/sh

sudo apt-get update
sudo apt-get install postgresql-9.1-postgis
sudo apt-get install postgis
sudo apt-get install unzip

# configure postgis
echo 'Configuring PostGIS'
sudo -u postgres createdb TreasureMap
sudo -u postgres createlang plpgsql TreasureMap
sudo -u postgres psql -d TreasureMap -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
sudo -u postgres psql -d TreasureMap -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql
sudo -u postgres psql -d TreasureMap -f /usr/share/postgresql/9.1/contrib/postgis_comments.sql
echo 'PostGIS Configuration Complete'
