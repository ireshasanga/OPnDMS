/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.controller;

import com.iresh.dao.ItemDataDAO;
import com.iresh.daoImpl.ItemDataDaoImpl;
import com.iresh.model.ItemData;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author Iresh
 */
public class AddToCartController extends HttpServlet {

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
            String itemCode = "";
            String itemName = "";
            String itemUnitPrice = "";
            String quantityOnHand = "";
            String imgUrl = "";

            String actionType = request.getParameter("actionType");

//            if (null != actionType) {
//                    switch (actionType) {
            if (null != actionType) {
                switch (actionType) {

                    case "getDataForItemCode": {

                        JSONObject responseObj = new JSONObject();
                        responseObj.put("message", false);

                        itemCode = request.getParameter("item_code");
                        System.out.println("item_code : " + itemCode);

                        ItemData itemData = new ItemData();
                        itemData.setInventoryItemCode(itemCode);

                        ItemDataDAO itemDataDao = new ItemDataDaoImpl();

                        try {

                            ItemData result = itemDataDao.getDataForItemCode(itemData);

                            itemName = result.getInventoryItemName();
                            itemUnitPrice = result.getUnitPrice();
                            quantityOnHand = result.getQuantityOnHand();
                            imgUrl = result.getImgUrl();

                            JSONObject viewSltdItmData = new JSONObject();
                            viewSltdItmData.put("itemCode", itemCode);
                            viewSltdItmData.put("itemName", itemName);
                            viewSltdItmData.put("itemUnitPrice", itemUnitPrice);
                            viewSltdItmData.put("quantityOnHand", quantityOnHand);
                            viewSltdItmData.put("imgUrl", imgUrl);

                            System.out.println("Result : " + viewSltdItmData);

                            if (result != null) {
                                responseObj.put("message", true);
                                responseObj.put("viewSltdItmData", viewSltdItmData);
                                response.getWriter().write(responseObj.toString());
                                break;
                            }

                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    }
                }
            }
        }
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
