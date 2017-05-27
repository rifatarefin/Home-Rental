package com.packt.webstore.domain;

import java.util.List;

/**
 * Created by rifat on 5/26/17.
 */
public class Search {

    private int minPrice;
    private int maxPrice;
//    private List<String> cities;
//    private List<String> locations;
//    private String propType;
//    private String purpose;


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
