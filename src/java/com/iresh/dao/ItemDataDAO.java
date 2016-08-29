/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.dao;

import com.iresh.model.ItemData;

/**
 *
 * @author Iresh
 */
public interface ItemDataDAO {
    
    public ItemData getDataForItemCode(ItemData itemData)throws Exception;
    
}
