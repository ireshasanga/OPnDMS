package com.iresh.model;

import java.util.Date;

/**
 *
 * @author Iresh
 */
public class Cart {

    private InventoryItem inventoryItem;
    private int orderQuantity;
    private String sessionId;
    private Date addedDate;

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    public Cart(InventoryItem inventoryItem, int orderQuantity, String sessionId, Date addedDate) {
        this.inventoryItem = inventoryItem;
        this.orderQuantity = orderQuantity;
        this.sessionId = sessionId;
        this.addedDate = addedDate;
    }

    public InventoryItem getInventoryItem() {
        return inventoryItem;
    }

    public void setInventoryItem(InventoryItem inventoryItem) {
        this.inventoryItem = inventoryItem;
    }

    public int getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(int orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

}
