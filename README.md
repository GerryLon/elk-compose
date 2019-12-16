# elk-compose
collect custom log with ELK in docker-compose

# Usage
cd ${root_of_project}
mkdir -p elasticsearch/data
chmod -R go+w elasticsearch/data
docker-compose up [-d]
