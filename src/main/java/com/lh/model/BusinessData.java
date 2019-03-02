package com.lh.model;

import java.util.List;

public class BusinessData {
   private String id;

   private MainData mainData;

   private List<SonData> sons;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public MainData getMainData() {
        return mainData;
    }

    public void setMainData(MainData mainData) {
        this.mainData = mainData;
    }

    public List<SonData> getSons() {
        return sons;
    }

    public void setSons(List<SonData> sons) {
        this.sons = sons;
    }
}
