#!/bin/zsh

# 사전 작업
# - docker-for-desktop 에서 file sharing 설정

curl -v -XPUT -H "Content-Type: application/json" 'localhost:9200/_snapshot/javacafe' -d '{ "type":"fs", "settings": { "location":"/es/book_backup/search_example", "compress":"true" } }'
curl -v 'localhost:9200/_snapshot/javacafe/_all?pretty'

curl -v -XPUT -H "Content-Type: application/json" 'localhost:9200/_snapshot/apache-web-log' -d '{ "type":"fs", "settings": { "location":"/es/book_backup/agg_example", "compress":"true" } }'
curl -v 'localhost:9200/_snapshot/apache-web-log/_all?pretty'

# snapshot 으로 index 복구
curl -XPOST -H "Content-Type: application/json" 'localhost:9200/_snapshot/javacafe/movie-search/_restore'
curl 'localhost:9200/_cat/indices/movie_search?v&pretty=true'

curl "localhost:9200/_snapshot/apache-web-log/_all?pretty=true"
curl -XPOST -H "Content-Type: application/json" 'localhost:9200/_snapshot/apache-web-log/default/_restore'
curl 'localhost:9200/_cat/indices/apache*?v&pretty=true'
