import ballerina/log;
import ballerinax/mongodb;

configurable string host = ?;
configurable int port = ?;
configurable string username = ?;
configurable string password = ?;

public function main() returns error? {
    
    mongodb:ConnectionConfig mongoConfig = {
        host: host,
        port: port,
        username: username,
        password: password,
        options: {sslEnabled: false, serverSelectionTimeout: 5000}
    };

    mongodb:Client mongoClient = check new (mongoConfig);
    string [] dbNames = check mongoClient->getDatabasesNames();
    log:printInfo("------------------ Database Names -------------------");
    foreach var dbName in dbNames {
        log:printInfo("Database Name : " + dbName);
    }
     mongoClient->close();
}
