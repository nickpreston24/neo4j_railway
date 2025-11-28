FROM neo4j:5.24-community

# Runtime ENV for auth (Railway vars override)
ENV NEO4J_AUTH=neo4j/${NEO4J_PASSWORD:-neo4j}

# JVM memory safe for Railway (512m heap, no GC spam)
ENV NEO4J_JAVA_OPTS="-Xms512m -Xmx512m -XX:+UseG1GC"

# Override default conf with minimal Railway-safe config
RUN echo 'dbms.memory.heap.initial_size=512m\n\
dbms.memory.heap.max_size=512m\n\
dbms.connector.bolt.enabled=true\n\
dbms.connector.bolt.listen_address=0.0.0.0:7687\n\
dbms.connector.http.enabled=true\n\
dbms.connector.http.listen_address=0.0.0.0:7474\n\
server.metrics.enabled=false' > $NEO4J_HOME/conf/neo4j.conf

# Expose ports
EXPOSE 7474 7687

# Explicit start
CMD ["neo4j", "start"]