package com.coravy.store.model;

import com.coravy.remoting.annotations.DataTransferObject;

/**
 * The domain model for a Product.
 * 
 * @author Stefan Saasen (stefan@coravy.com)
 */
@DataTransferObject
public final class Product {

    private long id = -1;
    private String name;
    private String vendor;
    private double weight;
    private double volume;
    private int stockAmount;
    private long category; // Instead of carrying the category nodes around we
                           // just reference the category id.

    /**
     * !Important: A default no-args constructor is always required for BlazeDS
     * data transfer objects
     */
    public Product() {
    }

    public Product(long id, String name) {
        this.id = id;
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getVolume() {
        return volume;
    }

    public void setVolume(double volume) {
        this.volume = volume;
    }

    public int getStockAmount() {
        return stockAmount;
    }

    public void setStockAmount(int stockAmount) {
        this.stockAmount = stockAmount;
    }

    public long getCategory() {
        return category;
    }

    public void setCategory(long category) {
        this.category = category;
    }

}
