package com.rifat.webstore.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by rifat on 5/26/17.
 */
public class Search {

    private int minPrice;
    private int maxPrice;
    private int minBed;
    private int maxBed;
    private int minBath;
    private int maxBath;
    private List<String> cities;
    private List<String> allCities;
//    private List<String> locations;
//    private String propType;
//    private String purpose;


    public Search() {

        this.cities=new ArrayList<>();
        this.allCities=new ArrayList<>();
        allCities.add("Dhaka");
        allCities.add("Chittagong");
        allCities.add("Sylhet");
        this.setMinPrice(0);
        this.setMaxPrice(999999999);
        this.setMinBed(0);
        this.setMaxBed(10);
        this.setMinBath(0);
        this.setMaxBath(10);

    }

    public int getMinBath() {
        return minBath;
    }

    public void setMinBath(int minBath) {
        this.minBath = minBath;
    }

    public int getMaxBath() {
        return maxBath;
    }

    public void setMaxBath(int maxBath) {
        this.maxBath = maxBath;
    }

    public int getMinBed() {
        return minBed;
    }

    public void setMinBed(int minBed) {
        this.minBed = minBed;
    }

    public int getMaxBed() {
        return maxBed;
    }

    public void setMaxBed(int maxBed) {
        this.maxBed = maxBed;
    }

    public List<String> getAllCities() {
        return allCities;
    }

    public void setAllCities(List<String> allCities) {
        this.allCities = allCities;
    }

    public List<String> getCities() {
        return cities;
    }

    public void setCities(List<String> cities) {
        this.cities = cities;
    }

    public int getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(int minPrice) {
        this.minPrice = minPrice;
    }

    public int getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(int maxPrice) {
        this.maxPrice = maxPrice;
    }
}
