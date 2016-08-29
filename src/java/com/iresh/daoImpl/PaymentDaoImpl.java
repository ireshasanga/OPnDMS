/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.daoImpl;

import com.iresh.dao.DBConnection;
import com.iresh.dao.PaymentDAO;
import com.iresh.model.Invoice;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import org.json.simple.JSONObject;

/**
 *
 * @author Iresh
 */
public class PaymentDaoImpl implements PaymentDAO {

    @Override
    public JSONObject saveInvoiceData(Invoice invoice) {

        JSONObject jsonObject = new JSONObject();
        try {

            //Retrieve Database Connection
            Connection conn = DBConnection.getConnection();
            if (conn != null) {// If connection is successfull
                String insertQuery = "INSERT INTO invoice (invoice_number,invoice_date,id_customer,invoice_address,delevery_address,invoice_status,"
                        + "invoice_currency,added_by,added_date_time,last_updated_by,last_updated_date_time)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
                //prepare quary for existing users
                PreparedStatement pstmt = conn.prepareStatement(insertQuery);

                pstmt.setString(1, invoice.getInvoiceNumber());
                pstmt.setDate(2, new Date(invoice.getInvoiceDate().getTime()));
                pstmt.setInt(3, invoice.getCustomerId());
                pstmt.setString(4, invoice.getInvoiceAddress());
                pstmt.setString(5, invoice.getDeliveryAddress());
                pstmt.setString(6, invoice.getInvoiceStatus());
                pstmt.setInt(7, invoice.getInvoiceCurrency());
                pstmt.setInt(8, invoice.getAddedBy());
                pstmt.setDate(9, new Date(invoice.getAddedDateTime().getTime()));
                pstmt.setInt(10, invoice.getLastUpdatedBy());
                pstmt.setDate(11, new Date(invoice.getLastUpdatedDate().getTime()));

                int status = pstmt.executeUpdate();

                Statement s = conn.createStatement();
                ResultSet rs = s.executeQuery("SELECT * FROM invoice WHERE invoice_number = '" + invoice.getInvoiceNumber() + "';");

                if (rs.next()) {
                    jsonObject.put("invoiceId", rs.getInt("id_invoice"));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return jsonObject;
    }

    @Override
    public JSONObject getLastInvoiceId() {

        JSONObject jsonObject = new JSONObject();
        try {

            //Retrieve Database Connection
            Connection conn = DBConnection.getConnection();
            if (conn != null) {// If connection is successfull

                Statement s = conn.createStatement();
                ResultSet rs = s.executeQuery("SELECT * FROM invoice ORDER BY invoice_number DESC LIMIT 1;");

                if (rs.next()) {
                    jsonObject.put("invoiceNumber", rs.getString("invoice_number"));
                    jsonObject.put("invoiceId", rs.getString("id_invoice"));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return jsonObject;
    }
}
