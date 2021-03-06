# Dockerfile to illustrate how Filebeat can be used with nginx
# Filebeat 6.1.2

# Build with:
# docker build -t filebeat .

# Run with:
# docker run -it --network=elknet --name filebeat -v /var/log/:/var/log/ filebeat

FROM docker.elastic.co/beats/filebeat:6.1.2


###############################################################################
#                                CONFIGURATION
###############################################################################

### configure Filebeat

# config file
COPY filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN chown filebeat /usr/share/filebeat/filebeat.yml
RUN chmod go-w /usr/share/filebeat/filebeat.yml
USER filebeat

# CA cert
RUN mkdir -p /etc/pki/tls/certs
ADD logstash-beats.crt /etc/pki/tls/certs/logstash-beats.crt
ADD filebeat.template.json /etc/filebeat/filebeat.template.json
