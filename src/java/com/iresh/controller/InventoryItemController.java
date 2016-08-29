/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.controller;

import com.iresh.dao.InventoryItemDAO;
import com.iresh.daoImpl.InventoryItemDaoImpl;
import com.iresh.model.InventoryItem;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

/**
 *
 * @author Iresh
 */
public class InventoryItemController extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            RequestDispatcher requestDispatcher;
            String tempPath = getServletContext().getInitParameter("itemImages");

            DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();

            fileItemFactory.setSizeThreshold(5 * 1024 * 1024);

            File fileLocation = File.createTempFile("MyCMS", "UploadedFile");

            fileItemFactory.setRepository(fileLocation);

            ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
            String fName = null;
            FileItem item = null;

            String method = "";
            String itemType = "";
            String itemGroup = "";
            String itemCode = "";
            String itemName = "";
            String unitOfHandling = "";
            String quantityOnHand = "";
            String reOrderLevel = "";
            String reOrderQuantity = "";
            String currency = "";
            String sellingPrice = "";
            String itemDesc = "";
            String unitPrice = "";

            try {

                List items = fileUpload.parseRequest(request);
//            InventoryItem inventoryItem = new InventoryItem();
                for (Object object : items) {
                    item = (FileItem) object;

                    if (item.isFormField()) {

                        if ("method".equals(item.getFieldName())) {
                            method = item.getString();
                            System.out.println("method :" + method);

                        }

                        if ("itemType".equals(item.getFieldName())) {
                            itemType = item.getString();
                            System.out.println("itemType :" + itemType);

                        }
                        if ("itemGroup".equals(item.getFieldName())) {
                            itemGroup = item.getString();
                            System.out.println("itemGroup :" + itemGroup);
                        }

                        if ("itemCode".equals(item.getFieldName())) {
                            itemCode = item.getString();
                            System.out.println("itemCode :" + itemCode);
                        }

                        if ("itemName".equals(item.getFieldName())) {
                            itemName = item.getString();
                            System.out.println("itemName :" + itemName);
                        }

                        if ("unitOfHandling".equals(item.getFieldName())) {
                            unitOfHandling = item.getString();
                            System.out.println("unitOfHandling :" + unitOfHandling);
                        }

                        if ("quantityOnHand".equals(item.getFieldName())) {
                            quantityOnHand = item.getString();
                            System.out.println("quantityOnHand :" + quantityOnHand);
                        }

                        if ("reOrderLevel".equals(item.getFieldName())) {
                            reOrderLevel = item.getString();
                            System.out.println("reOrderLevel :" + reOrderLevel);
                        }

                        if ("reOrderQuantity".equals(item.getFieldName())) {
                            reOrderQuantity = item.getString();
                            System.out.println("reOrderQuantity :" + reOrderQuantity);
                        }

                        if ("currency".equals(item.getFieldName())) {
                            currency = item.getString();
                            System.out.println("currency :" + currency);
                        }

                        if ("sellingPrice".equals(item.getFieldName())) {
                            sellingPrice = item.getString();
                            System.out.println("sellingPrice :" + sellingPrice);
                        }

                        if ("itemDesc".equals(item.getFieldName())) {
                            itemDesc = item.getString();
                            System.out.println("itemDesc :" + itemDesc);
                        }
                        if ("unitPrice".equals(item.getFieldName())) {
                            unitPrice = item.getString();
                            System.out.println("unitPrice :" + unitPrice);
                        }
                    } else {

//                            String fileName[] = username.split(" ");
//                            String imgName = fileName[0];
//                            fName = imgName + ".png";
//
//                            File file = new File(tempPath + fName);
//                            item.write(file);
//                            System.out.println("Name : " + fName);
//                        }
                        fName = itemCode + ".png";
                        File file = new File(tempPath + fName);
                        item.write(file);
                        System.out.println("Name : " + fName);
                    }

                }

                if (null != method) {
                    switch (method) {
                        case "save": {
//String inventoryItemCode, String inventoryItemName, int inventoryItemType, int unitOfHandling, int inventoryItemGroup, int currency, String quantityOnHand, String reorderLevel, String reorderQuantity, String unitPrice, String imageUrl, String inventoryItemDesc

//                            InventoryItem inventoyItem = new InventoryItem(itemCode, itemName, Integer.parseInt(itemType), Integer.parseInt(unitOfHandling), Integer.parseInt(itemGroup), Integer.parseInt(currency), quantityOnHand, reOrderLevel, reOrderQuantity, unitPrice, fName, itemDesc);
                            InventoryItem inventoyItem = new InventoryItem(itemCode, itemName, 1, Integer.parseInt(unitOfHandling), 2, Integer.parseInt(currency), quantityOnHand, reOrderLevel, reOrderQuantity, unitPrice, fName, itemDesc);
                            InventoryItemDAO inventoryItem = new InventoryItemDaoImpl();
                            JSONObject object = inventoryItem.saveInventoryItemData(inventoyItem);
                            response.getWriter().write(object.toString());
                        }
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace();
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(InventoryItemController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(InventoryItemController.class.getName()).log(Level.SEVERE, null, ex);
        }

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
