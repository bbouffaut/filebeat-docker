#!/bin/bash

curl -XPUT 'http://192.168.1.129:9200/_template/filebeat?pretty' -d@/etc/filebeat/filebeat.template.json
/etc/init.d/filebeat start
