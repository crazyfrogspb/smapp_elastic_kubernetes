FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.6.1
ADD staysense-cosine-sim-6.6.1.zip .
RUN elasticsearch-plugin install file:staysense-cosine-sim-6.6.1.zip
RUN yum install -y bind-utils
