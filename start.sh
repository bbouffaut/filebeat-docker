#!/bin/bash

curl -XPUT 'http://172.18.0.2:9200/_template/filebeat?pretty' -d@/etc/filebeat/filebeat.template.json
/etc/init.d/filebeat start
