package com.emredinc.app;

import org.bson.types.ObjectId;

public class StudentModel {
    private ObjectId id;  // MongoDB'nin ObjectId türünü kullanacağız
    private String adi;
    private String soyadi;
    private int mezuniyetYili;

    // Constructor
    public StudentModel(String adi, String soyadi, int mezuniyetYili) {
        this.adi = adi;
        this.soyadi = soyadi;
        this.mezuniyetYili = mezuniyetYili;
    }
    public StudentModel() {}

    // Getter ve Setter metodları
    public ObjectId getId() {
        return id;
    }

    public void setId(ObjectId id) {
        this.id = id;
    }

    public String getAdi() {
        return adi;
    }

    public void setAdi(String adi) {
        this.adi = adi;
    }

    public String getSoyadi() {
        return soyadi;
    }

    public void setSoyadi(String soyadi) {
        this.soyadi = soyadi;
    }

    public int getMezuniyetYili() {
        return mezuniyetYili;
    }

    public void setMezuniyetYili(int mezuniyetYili) {
        this.mezuniyetYili = mezuniyetYili;
    }
}
