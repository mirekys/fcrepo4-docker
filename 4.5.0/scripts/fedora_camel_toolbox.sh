######################
# Fedora Camel Toolbox
######################

/opt/karaf/bin/client -u karaf -h localhost -a 8101 -f "/root/fedora_camel_toolbox.script"

# Solr indexing
if [ ! -f "/opt/karaf/etc/org.fcrepo.camel.indexing.solr.cfg" ]; then
   /opt/karaf/bin/client -u karaf -h localhost -a 8101 "feature:install fcrepo-indexing-solr"
fi
sed -i 's|solr.baseUrl=localhost:8983/solr/collection1|solr.baseUrl=localhost:8080/solr/collection1|' /opt/karaf/etc/org.fcrepo.camel.indexing.solr.cfg
sed -i 's|fcrepo.authUsername=$|fcrepo.authUsername=fedoraAdmin|' /opt/karaf/etc/org.fcrepo.camel.indexing.solr.cfg
sed -i 's|fcrepo.authPassword=$|fcrepo.authPassword=secret3|' /opt/karaf/etc/org.fcrepo.camel.indexing.solr.cfg

# Triplestore indexing
if [ ! -f "/opt/karaf/etc/org.fcrepo.camel.indexing.triplestore.cfg" ]; then
   /opt/karaf/bin/client -u karaf -h localhost -a 8101 "feature:install fcrepo-indexing-triplestore"
fi
sed -i 's|fcrepo.authUsername=$|fcrepo.authUsername=fedoraAdmin|' /opt/karaf/etc/org.fcrepo.camel.indexing.triplestore.cfg
sed -i 's|fcrepo.authPassword=$|fcrepo.authPassword=secret3|' /opt/karaf/etc/org.fcrepo.camel.indexing.triplestore.cfg

# Audit service
if [ ! -f "/opt/karaf/etc/org.fcrepo.camel.audit.cfg" ]; then
   /opt/karaf/bin/client -u karaf -h localhost -a 8101 "feature:install fcrepo-audit-triplestore"
fi

# Fixity service
if [ ! -f "/opt/karaf/etc/org.fcrepo.camel.fixity.cfg" ]; then
   /opt/karaf/bin/client -u karaf -h localhost -a 8101 "feature:install fcrepo-fixity"
fi
sed -i 's|fcrepo.authUsername=$|fcrepo.authUsername=fedoraAdmin|' /opt/karaf/etc/org.fcrepo.camel.fixity.cfg
sed -i 's|fcrepo.authPassword=$|fcrepo.authPassword=secret3|' /opt/karaf/etc/org.fcrepo.camel.fixity.cfg

# Serialization service
if [ ! -f "/opt/karaf/etc/org.fcrepo.camel.serialization.cfg" ]; then
   /opt/karaf/bin/client -u karaf -h localhost -a 8101 "feature:install fcrepo-serialization"
fi
sed -i 's|fcrepo.authUsername=$|fcrepo.authUsername=fedoraAdmin|' /opt/karaf/etc/org.fcrepo.camel.serialization.cfg
sed -i 's|fcrepo.authPassword=$|fcrepo.authPassword=secret3|' /opt/karaf/etc/org.fcrepo.camel.serialization.cfg

# Reindexing service
if [ ! -f "/opt/karaf/etc/org.fcrepo.camel.reindexing.cfg" ]; then
   /opt/karaf/bin/client -u karaf -h localhost -a 8101 "feature:install fcrepo-reindexing"
fi
sed -i 's|fcrepo.authUsername=$|fcrepo.authUsername=fedoraAdmin|' /opt/karaf/etc/org.fcrepo.camel.reindexing.cfg
sed -i 's|fcrepo.authPassword=$|fcrepo.authPassword=secret3|' /opt/karaf/etc/org.fcrepo.camel.reindexing.cfg
