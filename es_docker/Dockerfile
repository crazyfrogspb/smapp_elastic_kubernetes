FROM docker.elastic.co/elasticsearch/elasticsearch:6.6.1
ADD staysense-cosine-sim-6.6.1.zip .
RUN elasticsearch-plugin install file:staysense-cosine-sim-6.6.1.zip
