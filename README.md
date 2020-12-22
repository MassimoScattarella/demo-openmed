### DEMO Keycloak for OpenMed


#### Keycloak
1. Keycloak Run
    ```
    docker-compose up -d keycloak-db-postgres keycloak
    ```

2. Per Keycloak vai in http://localhost:8080/auth , Click su 
   Administration e autenticati
    ```
    user        : admin
    password    : admin
    ```

1. Keycloak export data (Optional)
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

#### Kong
1. Kong Run
    ```
    docker-compose up -d kong-db-postgres kong-migration
    ```

    Attendi qualche secondo che la migrazione abbia finito

    ```
    docker-compose up -d kong
    ```

#### Konga
1. Kong Run
    ```
    docker-compose up -d konga-db-postgres konga-migration
    ```
     Attendi qualche secondo che la migrazione abbia finito

    ```
    docker-compose up -d konga
    ```

2. Per Keycloak vai in http://localhost:1337 , e crea la connessione verso kong

    ![connection](./images/connection.png)

    
   

