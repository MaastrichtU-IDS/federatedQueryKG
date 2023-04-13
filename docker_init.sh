#!/bin/bash

export DBA_PASSWORD=$(cat .env | sed 's/PASSWORD=//g')
if [ -z "$DBA_PASSWORD" ]
then
    echo "⚠️ No PASSWORD found in .env file, using default 'dba'"
    export DBA_PASSWORD='dba'
fi

# Download RDF files
# mkdir -p data
# cd data
# wget -N https://zenodo.org/record/3770918/files/hgnc.nq.gz
# wget -N https://zenodo.org/record/3770918/files/goa_human.nq.gz
# wget -N https://zenodo.org/record/3770918/files/drugbank.nq.gz
# tar -xzf *.gz


# Load the RDF files in virtuoso
docker compose exec virtuoso-goa-human isql -U dba -P $DBA_PASSWORD exec="ld_dir ('/opt/virtuoso-opensource/database/data', 'goa_human.nq.gz', NULL);"
docker compose exec virtuoso-goa-human isql -U dba -P $DBA_PASSWORD exec="rdf_loader_run();"

# Show the list of bulk loads
docker compose exec virtuoso-goa-human isql -U dba -P $DBA_PASSWORD exec="select * from DB.DBA.LOAD_LIST where ll_error IS NOT NULL"
