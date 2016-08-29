package com.iresh.controller;

import com.iresh.dao.LoginDao;
import com.iresh.daoImpl.LoginDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author Iresh
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LoginDao loginDao = new LoginDaoImpl();
        String message = loginDao.login(username, password);

        String messageArr[] = message.split("@");
        String status = messageArr[0];
        String firstName = messageArr[1];
        String cusId = messageArr[2];
        HttpSession session = request.getSession();
        session.setAttribute("cusId",cusId );
        System.out.println("cusId :"+cusId);

        System.out.println("firstName :" + firstName);

        if (status.equals("Success")) {

//             response.sendRedirect("inventoryItem2.jsp");
            response.sendRedirect("index.jsp");
        } //        else if(status.equals("Success") && userType.equals("user") ){
        //            response.sendRedirect("index.jsp");
        //        }
        else {
            response.sendRedirect("login.jsp");
        }
        System.out.println("message :" + message);
    }
}
