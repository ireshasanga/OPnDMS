package com.iresh.daoImpl;

import com.iresh.dao.CartDAO;
import com.iresh.dao.DBConnection;
import com.iresh.model.Cart;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Iresh
 */
public class CartDAOImpl implements CartDAO {

    @Override
    public JSONObject saveCart(Cart cart) {
        JSONObject object = new JSONObject();
        try {
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                String insertQuery = "INSERT INTO cart (inventory_item,session_id,order_quantity,added_date)VALUES(?,?,?,?)";

                PreparedStatement pstmt = conn.prepareStatement(insertQuery);
                pstmt.setInt(1, cart.getInventoryItem().getInventoryItemId());
                pstmt.setString(2, cart.getSessionId());
                pstmt.setInt(3, cart.getOrderQuantity());
                pstmt.setDate(4, new Date(cart.getAddedDate().getTime()));

                int status = pstmt.executeUpdate();
                object.put("status", status);

                Statement s = conn.createStatement();
                ResultSet rs = s.executeQuery("SELECT * FROM cart WHERE session_id = '" + cart.getSessionId() + "';");

                int noOfItems = 0;
                JSONArray items = new JSONArray();
                while (rs.next()) {
                    JSONObject cartItem = new JSONObject();
                    cartItem.put("item_id", rs.getInt("inventory_item"));
                    cartItem.put("order_quantity", rs.getInt("order_quantity"));

                    items.add(cartItem);
                    noOfItems++;
                }
                object.put("no_of_items", noOfItems);
                object.put("items", items);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return object;
    }

}
