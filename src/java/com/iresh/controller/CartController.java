package com.iresh.controller;

import com.iresh.dao.CartDAO;
import com.iresh.daoImpl.CartDAOImpl;
import com.iresh.model.Cart;
import com.iresh.model.InventoryItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author Iresh
 */
public class CartController extends HttpServlet {

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

        int itemId = "".equals(request.getParameter("itemId")) ? -1 : Integer.parseInt(request.getParameter("itemId")); // validate not be "" or null
        InventoryItem inventoryItem = itemId < 0 ? null : new InventoryItem(itemId);
        int orderQuantity = "".equals(request.getParameter("orderQuantity")) ? -1 : Integer.parseInt(request.getParameter("orderQuantity"));
        String sessionId = request.getParameter("sessionId");
        Date date = new Date();

        Cart cart = new Cart(inventoryItem, orderQuantity, sessionId, date);
        CartDAO cartDAO = new CartDAOImpl();
        JSONObject object = cartDAO.saveCart(cart);
        response.getWriter().write(object.toString());
        
        
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
