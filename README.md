```sh
helm install elasticsearch .

# es 구동에 15분 정도 걸림 

kubectl port-forward es-0 9200:9200

# node 상태
curl -v  'localhost:9200/_nodes/stat?pretty' 
curl -v  'localhost:9200/_cat/health?v'
```


## Ref
- https://www.digitalocean.com/community/tutorials/how-to-set-up-an-elasticsearch-fluentd-and-kibana-efk-logging-stack-on-kubernetes


