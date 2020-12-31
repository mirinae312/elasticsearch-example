```sh
helm install elasticsearch .

# es 구동에 15분 정도 걸림 
kubectl port-forward --address localhost service/es-cluster 9200:9200
kubectl port-forward --address localhost service/kibana 5601:5601

# node 상태
curl -v  'localhost:9200/_nodes/stat?pretty' 
curl -v  'localhost:9200/_cat/health?v'
```



## Ref
- https://www.digitalocean.com/community/tutorials/how-to-set-up-an-elasticsearch-fluentd-and-kibana-efk-logging-stack-on-kubernetes


