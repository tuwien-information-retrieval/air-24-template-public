# ------------------------------------------- decompress data
# validate ./data/* files
if [ ! -d data ]; then echo "data/ directory not found"; exit 1; fi
if ! ls data/*-chunk-* &> /dev/null && ! ls data/*.md5 &> /dev/null; then echo "invalid files found in data/"; exit 1; fi

# create data-merged directory
rm -rf data-merged
mkdir data-merged
echo "created data-merged directory"

# merge chunks into data-merged directory
cat data/*-chunk-* > data-merged/merged.tar.gz
echo "merged chunks into data-merged/merged.tar.gz"

# validate checksum
expected_checksum=$(cat data/*.md5)
actual_checksum=$(md5sum data-merged/merged.tar.gz | awk '{ print $1 }')
if [ $expected_checksum != $actual_checksum ]; then echo "checksum mismatch"; exit 1; fi
echo "checksum matched: $expected_checksum == $actual_checksum"

# untar in data-merged
tar -xzf data-merged/merged.tar.gz -C data-merged
rm data-merged/merged.tar.gz
echo "untarred data-merged/merged.tar.gz"

# ------------------------------------------- start
docker-compose up

docker exec -it neural-noodle /bin/bash
open http://localhost:8888/

# ------------------------------------------- stop
docker-compose down

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)

yes | docker container prune
yes | docker image prune
yes | docker volume prune
yes | docker network prune
yes | docker system prune

# ------------------------------------------- verify cleanup
docker ps --all
docker images
docker system df
docker volume ls
docker network ls
