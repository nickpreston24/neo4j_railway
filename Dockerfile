FROM neo4j:5.24-enterprise

# Accept license (required for Enterprise on Railway)
ENV NEO4J_ACCEPT_LICENSE_AGREEMENT=yes

# These are the ONLY variables Neo4j actually reads at runtime
# Railway will auto-generate a strong random password for NEO4J_AUTH on first deploy
ENV NEO4J_AUTH=neo4j/${NEO4J_PASSWORD}

# Optional: enable Bolt + HTTP
ENV NEO4J_dbms_connector_bolt_advertised__address=0.0.0.0:7687
ENV NEO4J_dbms_connector_http_advertised__address=0.0.0.0:7474

EXPOSE 7474 7687
