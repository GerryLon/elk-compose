
set -e

tag=${1:-test}

docker build -t mydomain.com/app:"$tag" .
docker push mydomain.com/app:"$tag"
