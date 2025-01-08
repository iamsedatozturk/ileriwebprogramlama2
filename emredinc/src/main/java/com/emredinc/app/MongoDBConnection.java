package com.emredinc.app;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.DB;
import com.mongodb.DBCollection;

public class MongoDBConnection {
    private static MongoClient mongoClient;

    public static MongoClient getConnection() {
        if (mongoClient == null) {
        	MongoClientURI uri = new MongoClientURI("mongodb+srv://sa:Zw5usAorgx3NGPca@cluster0.9ozba.mongodb.net/");
            mongoClient = new MongoClient(uri);
        }
        return mongoClient;
    }

    public static DB getDatabase(String dbName) {
        return getConnection().getDB(dbName);
    }

    public static DBCollection getCollection(String dbName, String collectionName) {
        return getDatabase(dbName).getCollection(collectionName);
    }
    
}
