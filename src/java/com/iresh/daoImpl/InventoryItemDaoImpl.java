/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.daoImpl;

import com.iresh.dao.DBConnection;
import com.iresh.dao.InventoryItemDAO;
import com.iresh.model.InventoryItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import org.json.simple.JSONObject;

/**
 *
 * @author Iresh
 */
public class InventoryItemDaoImpl implements InventoryItemDAO{        

    @Override
    public JSONObject saveInventoryItemData(InventoryItem inventoryItem) {
        JSONObject Object = new JSONObject();
       
        Connection conn = DBConnection.getConnection();
        try{
             if (conn != null) {
                String insertQuery = "INSERT INTO cart (inventry_item_id,inventry_item_code,inventry_item_name,unit_of_handling,quantity_on_hand,reorder_level,reorder_quantity,unit_price,img_url,inventory_item_type,inventory_item_group,currency,inventory_item_desc)VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement pstmt = conn.prepareStatement(insertQuery);
                pstmt.setString(1, inventoryItem.getInventoryItemCode());
                pstmt.setString(2, inventoryItem.getInventoryItemName());
                pstmt.setInt(3, inventoryItem.getUnitOfHandling());
                pstmt.setString(4, inventoryItem.getQuantityOnHand());
                pstmt.setString(5, inventoryItem.getReorderLevel());
                pstmt.setString(6, inventoryItem.getReorderQuantity());
                pstmt.setString(7, inventoryItem.getUnitPrice());
                pstmt.setString(8, inventoryItem.getImageUrl());
                pstmt.setInt(9, inventoryItem.getInventoryItemType());
                pstmt.setInt(10, inventoryItem.getInventoryItemGroup());
                pstmt.setInt(11, inventoryItem.getCurrency());
                pstmt.setString(12, inventoryItem.getInventoryItemDesc());
                
//                int status = pstmt.executeUpdate();

                  int status = pstmt.executeUpdate();
             
                if(status == 1){
                    
                    System.out.println("success");
//                    Object.put("itemCode", rs.getString("inventry_item_code"));
                }
            
             }
            
        }catch(Exception ex){
        ex.printStackTrace();
        }
        return Object;
    }


    
}
