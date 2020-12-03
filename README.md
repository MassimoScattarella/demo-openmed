### DEMO Keycloak for OpenMed

1. Run keyclaok
```
docker-compose up
```

2. Vai in http://localhost:8080/auth/admin e autenticati
```
user        : admin
password    : admin
```

3. Export data (Optional)
Una volta configurato puoi usare questo comando per esportare la config, quindi mentre gira il container lanciare il seguente comando.
La comodita' e che se riavvi cancellando il container ha il volume associato per rileggere la conf.
Per esempio ho chiamato realm e file da esportare e importare 'openmed'

```
docker-compose exec keycloak /opt/jboss/keycloak/bin/standalone.sh \
    -Djboss.socket.binding.port-offset=100 -Dkeycloak.migration.action=export \
    -Dkeycloak.migration.provider=singleFile \
    -Dkeycloak.migration.realmName=openmed \
    -Dkeycloak.migration.usersExportStrategy=REALM_FILE \
    -Dkeycloak.migration.file=/tmp/config/openmed.json
```