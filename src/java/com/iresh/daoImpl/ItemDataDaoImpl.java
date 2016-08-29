/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.daoImpl;

import com.iresh.dao.DBConnection;
import com.iresh.dao.ItemDataDAO;
import com.iresh.model.ItemData;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Iresh
 */
public class ItemDataDaoImpl implements ItemDataDAO {

    @Override
    public ItemData getDataForItemCode(ItemData itemData) throws Exception {

        try {
            //Retrieve DB Connection
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                String getDataQuery = "SELECT * FROM inventory_item WHERE inventry_item_code=?";

                PreparedStatement pstmt = conn.prepareStatement(getDataQuery);
                pstmt.setString(1, itemData.getInventoryItemCode());

                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {

//                    System.out.println("Result + " + rs.toString());
                    itemData.setInventoryItemName(rs.getString(3));
                    itemData.setQuantityOnHand(rs.getString(5));
                    itemData.setUnitPrice(rs.getString(9));
                    itemData.setImgUrl(rs.getString(10));
                    
                    System.out.println("itemData : "+itemData);
                    
                    return itemData;
                    
                    
                } else {
                    System.out.println("Result else + " + rs);
                }

            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
        return null;
    }

}
