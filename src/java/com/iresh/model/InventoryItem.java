package com.iresh.model;

/**
 *
 * @author Iresh
 */
public class InventoryItem {

    private int inventoryItemId;
    private String inventoryItemCode;

    private String inventoryItemName;
    private int inventoryItemType;
    private int unitOfHandling;
    private int inventoryItemGroup;
    private int currency;
    private String quantityOnHand;
    private String reorderLevel;
    private String reorderQuantity;
    private String unitPrice;
    private String imageUrl;
    private String inventoryItemDesc;

    public InventoryItem(int inventoryItemId) {
        this.inventoryItemId = inventoryItemId;
    }
//Constructor for save Item Details in DB    

    public InventoryItem(String inventoryItemCode, String inventoryItemName, int inventoryItemType, int unitOfHandling, int inventoryItemGroup, int currency, String quantityOnHand, String reorderLevel, String reorderQuantity, String unitPrice, String imageUrl, String inventoryItemDesc) {
        this.inventoryItemCode = inventoryItemCode;
        this.inventoryItemName = inventoryItemName;
        this.inventoryItemType = inventoryItemType;
        this.unitOfHandling = unitOfHandling;
        this.inventoryItemGroup = inventoryItemGroup;
        this.currency = currency;
        this.quantityOnHand = quantityOnHand;
        this.reorderLevel = reorderLevel;
        this.reorderQuantity = reorderQuantity;
        this.unitPrice = unitPrice;
        this.imageUrl = imageUrl;
        this.inventoryItemDesc = inventoryItemDesc;
    }

    public int getInventoryItemId() {
        return inventoryItemId;
    }

    public void setInventoryItemId(int inventoryItemId) {
        this.inventoryItemId = inventoryItemId;
    }

    public String getInventoryItemCode() {
        return inventoryItemCode;
    }

    public void setInventoryItemCode(String inventoryItemCode) {
        this.inventoryItemCode = inventoryItemCode;
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

    /**
     * @return the inventoryItemType
     */
    public int getInventoryItemType() {
        return inventoryItemType;
    }

    /**
     * @param inventoryItemType the inventoryItemType to set
     */
    public void setInventoryItemType(int inventoryItemType) {
        this.inventoryItemType = inventoryItemType;
    }

    /**
     * @return the unitOfHandling
     */
    public int getUnitOfHandling() {
        return unitOfHandling;
    }

    /**
     * @param unitOfHandling the unitOfHandling to set
     */
    public void setUnitOfHandling(int unitOfHandling) {
        this.unitOfHandling = unitOfHandling;
    }

    /**
     * @return the inventoryItemGroup
     */
    public int getInventoryItemGroup() {
        return inventoryItemGroup;
    }

    /**
     * @param inventoryItemGroup the inventoryItemGroup to set
     */
    public void setInventoryItemGroup(int inventoryItemGroup) {
        this.inventoryItemGroup = inventoryItemGroup;
    }

    /**
     * @return the currency
     */
    public int getCurrency() {
        return currency;
    }

    /**
     * @param currency the currency to set
     */
    public void setCurrency(int currency) {
        this.currency = currency;
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
     * @return the reorderLevel
     */
    public String getReorderLevel() {
        return reorderLevel;
    }

    /**
     * @param reorderLevel the reorderLevel to set
     */
    public void setReorderLevel(String reorderLevel) {
        this.reorderLevel = reorderLevel;
    }

    /**
     * @return the reorderQuantity
     */
    public String getReorderQuantity() {
        return reorderQuantity;
    }

    /**
     * @param reorderQuantity the reorderQuantity to set
     */
    public void setReorderQuantity(String reorderQuantity) {
        this.reorderQuantity = reorderQuantity;
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
     * @return the imageUrl
     */
    public String getImageUrl() {
        return imageUrl;
    }

    /**
     * @param imageUrl the imageUrl to set
     */
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    /**
     * @return the inventoryItemDesc
     */
    public String getInventoryItemDesc() {
        return inventoryItemDesc;
    }

    /**
     * @param inventoryItemDesc the inventoryItemDesc to set
     */
    public void setInventoryItemDesc(String inventoryItemDesc) {
        this.inventoryItemDesc = inventoryItemDesc;
    }

}
