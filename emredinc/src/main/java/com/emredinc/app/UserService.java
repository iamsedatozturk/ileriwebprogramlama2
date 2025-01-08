package com.emredinc.app;


import com.mongodb.DB;
import com.mongodb.DBCollection;

import java.util.ArrayList;
import java.util.List;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;

public class UserService {

    private DB database = MongoDBConnection.getDatabase("mezun_portal");

    // Kullanıcı kaydetme
    public void saveUser(UserEntity user) {
        DBCollection collection = database.getCollection("users");

        // Kullanıcı belgesi oluştur
        DBObject userDocument = new BasicDBObject("email", user.getEmail())
                .append("password", user.getPassword()) // Şifreyi hash'lemek önerilir (ör. BCrypt)
                .append("fullName", user.getFullName())
                .append("gender", user.getGender())
                .append("city", user.getCity())
                .append("hobbies", user.getHobbies()); // Hobileri liste olarak kaydet

        // Kullanıcıyı ekle
        collection.insert(userDocument);
    }

    // Kullanıcı doğrulama
    public boolean authenticateUser(String email, String password) {
        DBCollection collection = database.getCollection("users");

        // Kullanıcıyı bulmak için sorgu oluştur
        DBObject query = new BasicDBObject("email", email);
        DBObject user = collection.findOne(query);

        if (user != null && user.get("password").equals(password)) {
            return true;
        }

        return false;
    }
    
 // Kullanıcı listesini döndürme
    public List<UserEntity> getUserList() {
        DBCollection collection = database.getCollection("users");

        // Tüm kullanıcıları almak için cursor kullan
        DBCursor cursor = collection.find();

        List<UserEntity> userList = new ArrayList<>();

        // Kullanıcıları döngüyle işle ve listeye ekle
        while (cursor.hasNext()) {
            DBObject userDocument = cursor.next();
            UserEntity user = new UserEntity();
            user.setEmail((String) userDocument.get("email"));
            user.setPassword((String) userDocument.get("password"));
            user.setFullName((String) userDocument.get("fullName"));
            user.setGender((String) userDocument.get("gender"));
            user.setCity((String) userDocument.get("city"));
            user.setHobbies((List<String>) userDocument.get("hobbies")); // Hobiler liste olarak alınır

            userList.add(user);
        }

        return userList;
    }
}
