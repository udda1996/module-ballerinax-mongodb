import ballerina/log;
import ballerinax/mongodb;

configurable string host = ?;
configurable int port = ?;
configurable string username = ?;
configurable string password = ?;
configurable string database = ?;

public function main() returns error? {
    
    mongodb:ConnectionConfig mongoConfig = {
        host: host,
        port: port,
        username: username,
        password: password,
        options: {sslEnabled: false, serverSelectionTimeout: 5000}
    };

    mongodb:Client mongoClient = check new (mongoConfig);
    
    string [] collectionNames = check mongoClient->getCollectionNames(database);
    log:printInfo("------------------ Collection Names -------------------");
    foreach var collectionName in collectionNames {
        log:printInfo("Collection Name : " + collectionName);
    }
     mongoClient->close();
}
