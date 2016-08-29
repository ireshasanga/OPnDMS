package com.iresh.daoImpl;

import com.iresh.dao.DBConnection;
import com.iresh.dao.LoginDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Iresh
 */
public class LoginDaoImpl implements LoginDao {

    @Override
    public String login(String username, String password) {

        try {

            //Retrieve Database Connection
            Connection conn = DBConnection.getConnection();
            if (conn != null) {// If connection is successfull
                String userExistQuery = "SELECT * FROM customer WHERE username=? AND password=?";
                //prepare quary for existing users
                PreparedStatement pstmt = conn.prepareStatement(userExistQuery);
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                //Execute query and assign to resultset object
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {// if user not exist
                    String firstName = rs.getString("c_first_name");
                    String cusId = rs.getString("id_customer");
                    return "Success"+"@"+firstName+"@"+cusId;
//                    return "Success";
                }else{
                    return "Error";
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Username Or Password invalid";
}
}