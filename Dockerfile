FROM neo4j:5.24-community 
# Community edition — lighter, no license BS

# Runtime ENV for auth (Railway vars override this)
ENV NEO4J_AUTH=neo4j/${NEO4J_PASSWORD:-neo4j}

# Expose ports
EXPOSE 7474 7687

# Explicit start command (no aliases, no help spam)
CMD ["neo4j", "start"]
