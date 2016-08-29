/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.daoImpl;

import com.iresh.dao.DBConnection;
import com.iresh.dao.RegisterDAO;
import com.iresh.model.Register;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Iresh
 */
public class RegisterDaoImpl implements RegisterDAO {

    @Override
    public String registerCustomer(Register register) throws Exception {
        
        try{
        
            //Retrieve Database Connection
            Connection conn = DBConnection.getConnection();
            if(conn != null){// If connection is successfull
                String userExistQuery = "SELECT * FROM customer WHERE username=?";
                //prepare quary for existing users
                PreparedStatement pstmt = conn.prepareStatement(userExistQuery);
                pstmt.setString(1, register.getUsername());
                //Execute query and assign to resultset object
                ResultSet rs = pstmt.executeQuery();
                
                
                if(!rs.next()){// if user not exist
                
                    String insertQuery = "INSERT INTO customer (username,password,c_first_name,c_last_name,email,prefered_currency,user_type)VALUES(?,?,?,?,?,?,?)";
                    
                    PreparedStatement pstmt2 = conn.prepareStatement(insertQuery);
//                    pstmt2.setString(1, "1");
                    pstmt2.setString(1, register.getUsername());
                    pstmt2.setString(2, register.getPassword());
                    pstmt2.setString(3, register.getFirstName());
                    pstmt2.setString(4, register.getLastName());
                    pstmt2.setString(5, register.getEmail());
                    pstmt2.setString(6, register.getCurrency());
                    pstmt2.setString(7, register.getUserType());
                    
//                    pstmt2.executeUpdate();
//                    pstmt2.execute();
                    
                    int status = pstmt2.executeUpdate();
                    
                    if(status == 1){
                        return "success";
                    }
                }else{
                    return "exist";
                }
            }
        }catch(Exception ex){
        throw ex;
        }
        return "error";
        
//                try {
//             // Retrieve Database Connection
//            Connection conn = DBConnection.getConnection();
//            if (conn != null) { // DB connection success
//                String userExistQuery = "SELECT * FROM register WHERE username=?";
//                // Prepare query for check existing users
//                PreparedStatement pstmt = conn.prepareStatement(userExistQuery);
//                pstmt.setString(1, r.getUsername());
//                // execute query and assign to resultset object
//                ResultSet rs = pstmt.executeQuery();
//                if (!rs.next()) { // user not exist
//
//                    String insertQuery = "INSERT INTO register VALUES(?,?,?,?,?)";
//
//                    PreparedStatement pstmt2 = conn.prepareStatement(insertQuery);
//                    pstmt2.setString(1, r.getUsername());
//                    pstmt2.setString(2, r.getPassword());
//                    pstmt2.setString(3, r.getGender());
//                    pstmt2.setString(4, r.getAge());
//                    pstmt2.setString(5, r.getInstruction());
//
//                    int status = pstmt2.executeUpdate();
//                    if (status == 1) {
//                        return "success";
//                    }
//                } else { // user exist
//                    return "exist";
//                }            }
//        } catch (Exception ex) {
//            throw ex;
//        }
//        return "error";
    }
    
}
