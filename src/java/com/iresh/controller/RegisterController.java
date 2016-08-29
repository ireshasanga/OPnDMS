/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.controller;

import com.iresh.dao.RegisterDAO;
import com.iresh.daoImpl.RegisterDaoImpl;
import com.iresh.model.Register;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Iresh
 */
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = "";
            String password = "";
            String email = "";
            String currency = "";
            String firstName = "";
            String lastName = "";
            String userType = "";
            

            firstName = request.getParameter("first_name");
            lastName = request.getParameter("last_name");
            email = request.getParameter("email");
            currency = request.getParameter("currency");
            username = request.getParameter("username");
            password = request.getParameter("password");
            userType = request.getParameter("userType");
            
            //Initialize model object
            Register register = new Register();
            
           
            register.setFirstName(firstName);
            register.setPassword(password);
            register.setLastName(lastName);
            register.setCurrency(currency);
            register.setEmail(email);
            register.setUsername(username);
            register.setUserType(userType);
            
            RegisterDAO RegisterDaoImpl = new RegisterDaoImpl();
            
            try{
                
                String result = RegisterDaoImpl.registerCustomer(register);
                
                if (result.equals("success")){
                    response.sendRedirect("login.jsp");
                    showMessage();
                   //  JOptionPane.showMessageDialog(null, result, "InfoBox: " + result, JOptionPane.INFORMATION_MESSAGE);
                    
                    //out.println("Successfully Registered..!");
                }else if(result.equals("exist")){
                    out.println("User already exist..!");
                }else{
                    out.println("System Error..!");
                }
            }catch(Exception ex){
                out.println("System Error has occured..!");
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
//                         try {
//                String result = registerDAOImpl.registerForm(register);
//
//                if (result.equals("success")) {
//                    out.println("Form Data registered successfully");
//                } else if (result.equals("exist")) {
//                    out.println("Username already exist");
//                } else {
//                    out.println("Form data not registered successfully. System Error !!!");
//                }
//
//            } catch (Exception ex) {
//                out.println("System Errror !!!!!");
//                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
//            }
        }
    }
public void showMessage() {
    JOptionPane.showMessageDialog(null, "this is a pop up message");
}
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
