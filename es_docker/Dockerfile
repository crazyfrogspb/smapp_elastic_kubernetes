FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.6.1
ADD staysense-cosine-sim-6.6.1.zip .
RUN elasticsearch-plugin install file:staysense-cosine-sim-6.6.1.zip
COPY ["log4j2.properties","/usr/share/elasticsearch/config/"]
RUN sed -i "s|debug|info|g" /usr/share/elasticsearch/config/log4j2.properties
RUN elasticsearch-plugin install file:readonlyrest-1.17.4_es6.6.1.zip
RUN yes | /usr/share/elasticsearch/bin/elasticsearch-plugin remove x-pack --purge
