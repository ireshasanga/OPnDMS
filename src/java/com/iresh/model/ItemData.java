/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.model;

/**
 *
 * @author Iresh
 */
public class ItemData {
    
    private String inventoryItemId;
    private String inventoryItemName;
    private String inventoryItemCode;
    private String unitOfHandling;
    private String quantityOnHand;
    private String averageCost;
    private String unitPrice;
    private String imgUrl;

    /**
     * @return the inventoryItemId
     */
    public String getInventoryItemId() {
        return inventoryItemId;
    }

    /**
     * @param inventoryItemId the inventoryItemId to set
     */
    public void setInventoryItemId(String inventoryItemId) {
        this.inventoryItemId = inventoryItemId;
    }

    /**
     * @return the inventoryItemCode
     */
    public String getInventoryItemCode() {
        return inventoryItemCode;
    }

    /**
     * @param inventoryItemCode the inventoryItemCode to set
     */
    public void setInventoryItemCode(String inventoryItemCode) {
        this.inventoryItemCode = inventoryItemCode;
    }

    /**
     * @return the unitOfHandling
     */
    public String getUnitOfHandling() {
        return unitOfHandling;
    }

    /**
     * @param unitOfHandling the unitOfHandling to set
     */
    public void setUnitOfHandling(String unitOfHandling) {
        this.unitOfHandling = unitOfHandling;
    }

    /**
     * @return the quantityOnHand
     */
    public String getQuantityOnHand() {
        return quantityOnHand;
    }

    /**
     * @param quantityOnHand the quantityOnHand to set
     */
    public void setQuantityOnHand(String quantityOnHand) {
        this.quantityOnHand = quantityOnHand;
    }

    /**
     * @return the averageCost
     */
    public String getAverageCost() {
        return averageCost;
    }

    /**
     * @param averageCost the averageCost to set
     */
    public void setAverageCost(String averageCost) {
        this.averageCost = averageCost;
    }

    /**
     * @return the unitPrice
     */
    public String getUnitPrice() {
        return unitPrice;
    }

    /**
     * @param unitPrice the unitPrice to set
     */
    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    /**
     * @return the imgUrl
     */
    public String getImgUrl() {
        return imgUrl;
    }

    /**
     * @param imgUrl the imgUrl to set
     */
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    /**
     * @return the inventoryItemName
     */
    public String getInventoryItemName() {
        return inventoryItemName;
    }

    /**
     * @param inventoryItemName the inventoryItemName to set
     */
    public void setInventoryItemName(String inventoryItemName) {
        this.inventoryItemName = inventoryItemName;
    }
    
}
