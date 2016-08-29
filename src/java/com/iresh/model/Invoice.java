/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.model;

import java.util.Date;



/**
 *
 * @author Iresh
 */
public class Invoice {
    
    private int incoiceId;
    private String invoiceNumber;
    private Date invoiceDate;
    private int customerId;
    private String invoiceAddress;
    private String deliveryAddress;
    private String invoiceStatus;
    private int invoiceCurrency;
    private int addedBy;
    private Date addedDateTime;
    private int lastUpdatedBy;
    private Date lastUpdatedDate;

    /**
     * @return the invoiceNumber
     */
    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    /**
     * @param invoiceNumber the invoiceNumber to set
     */
    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    /**
     * @return the invoiceDate
     */
    public Date getInvoiceDate() {
        return invoiceDate;
    }

    /**
     * @param invoiceDate the invoiceDate to set
     */
    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    /**
     * @return the customerId
     */
    public int getCustomerId() {
        return customerId;
    }

    /**
     * @param customerId the customerId to set
     */
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    /**
     * @return the invoiceAddress
     */
    public String getInvoiceAddress() {
        return invoiceAddress;
    }

    /**
     * @param invoiceAddress the invoiceAddress to set
     */
    public void setInvoiceAddress(String invoiceAddress) {
        this.invoiceAddress = invoiceAddress;
    }

    /**
     * @return the deliveryAddress
     */
    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    /**
     * @param deliveryAddress the deliveryAddress to set
     */
    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    /**
     * @return the invoiceStatus
     */
    public String getInvoiceStatus() {
        return invoiceStatus;
    }

    /**
     * @param invoiceStatus the invoiceStatus to set
     */
    public void setInvoiceStatus(String invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
    }

    /**
     * @return the invoiceCurrency
     */
    public int getInvoiceCurrency() {
        return invoiceCurrency;
    }

    /**
     * @param invoiceCurrency the invoiceCurrency to set
     */
    public void setInvoiceCurrency(int invoiceCurrency) {
        this.invoiceCurrency = invoiceCurrency;
    }

    /**
     * @return the addedBy
     */
    public int getAddedBy() {
        return addedBy;
    }

    /**
     * @param addedBy the addedBy to set
     */
    public void setAddedBy(int addedBy) {
        this.addedBy = addedBy;
    }

    /**
     * @return the addedDateTime
     */
    public Date getAddedDateTime() {
        return addedDateTime;
    }

    /**
     * @param addedDateTime the addedDateTime to set
     */
    public void setAddedDateTime(Date addedDateTime) {
        this.addedDateTime = addedDateTime;
    }



    /**
     * @return the lastUpdatedDate
     */
    public Date getLastUpdatedDate() {
        return lastUpdatedDate;
    }

    /**
     * @param lastUpdatedDate the lastUpdatedDate to set
     */
    public void setLastUpdatedDate(Date lastUpdatedDate) {
        this.lastUpdatedDate = lastUpdatedDate;
    }

    /**
     * @return the lastUpdatedBy
     */
    public int getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    /**
     * @param lastUpdatedBy the lastUpdatedBy to set
     */
    public void setLastUpdatedBy(int lastUpdatedBy) {
        this.lastUpdatedBy = lastUpdatedBy;
    }
    
    
    
}
