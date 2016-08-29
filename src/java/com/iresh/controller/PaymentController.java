/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.controller;

import com.iresh.dao.PaymentDAO;
import com.iresh.dao.invoiceItemDAO;
import com.iresh.daoImpl.PaymentDaoImpl;
import com.iresh.model.Invoice;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
public class PaymentController extends HttpServlet {

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
        String customer = request.getParameter("customer");
        String items = request.getParameter("items");
        String address = request.getParameter("address");
        String currency = request.getParameter("currency");
        String customerName = request.getParameter("customerName");
        System.out.println("address " + address);
        System.out.println("currency " + currency);
        System.out.println("customerName " + customerName);

        String itemData[] = items.split("@td");

        int itemId = Integer.parseInt(itemData[0]);
        String unitPrice = itemData[1];
        String orderQty = itemData[2];
        String itemQtDesc = itemData[3];

        System.out.println("customer : " + customer);
        System.out.println("items : " + items);

// For getting the current Date
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Date dateobj = new Date();
        System.out.println(df.format(dateobj));
        Date date = dateobj;

// Generating the invoice number
        //SUN2015_000001
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int year = cal.get(Calendar.YEAR);
        String IVCNUM = "";
        String OID = "";

        JSONObject jSONObjectInvId = new JSONObject();
        PaymentDAO paymentDAOImplInvId = new PaymentDaoImpl();
        jSONObjectInvId = paymentDAOImplInvId.getLastInvoiceId();
        
        System.out.println(" jSONObjectInvId :"+jSONObjectInvId);

//        "SUN2015_000001";
        String lastInvoice = jSONObjectInvId.get("invoiceNumber").toString();
        if (lastInvoice != null) {
            String lastInvoiceArray[] = lastInvoice.split("_");
            String iNo = lastInvoiceArray[1].trim();
            int iu = Integer.parseInt(iNo);
            ++iu;

            if (iu < 10) {
                IVCNUM = "SUN" + year + "_00000" + (iu);
                OID = "OID_" + itemId + "_" + customer + "00000" + iu + "_1";
            } else if (iu < 100) {
                IVCNUM = "SUN" + year + "_0000" + (iu);
                OID = "OID_" + itemId + "_" + customer + "0000" + iu + "_1";
            } else if (iu < 1000) {
                IVCNUM = "SUN" + year + "_000" + (iu);
                OID = "OID_" + itemId + "_" + customer + "000" + iu + "_1";
            } else if (iu < 10000) {
                IVCNUM = "SUN" + year + "_00" + (iu);
                OID = "OID_" + itemId + "_" + customer + "00" + iu + "_1";
            } else if (iu < 100000) {
                IVCNUM = "SUN" + year + "_0" + (iu);
                OID = "OID_" + itemId + "_" + customer + "0" + iu + "_1";
            } else {
                IVCNUM = "SUN" + year + "_" + (iu);
                OID = "OID_" + itemId + "_" + customer + iu + "_1";
            }
        } else {
            IVCNUM = "SUN" + year + "_00000" + "1";
            OID = "OID_" + itemId + "_" + customer + "000001_1";
        }
        System.out.println("IVCNUM :" + IVCNUM);
        System.out.println("OID :" + OID);

//Save data into the invoice table
        Invoice invoice = new Invoice();

        invoice.setInvoiceNumber(IVCNUM);
        invoice.setInvoiceDate(date);
        invoice.setCustomerId(Integer.parseInt(customer));
        invoice.setInvoiceAddress(address);
        invoice.setDeliveryAddress(address);
        invoice.setInvoiceStatus("pending");
        invoice.setInvoiceCurrency(1);
        invoice.setAddedBy(Integer.parseInt(customer));
        invoice.setAddedDateTime(date);
        invoice.setLastUpdatedDate(date);
        invoice.setLastUpdatedBy(Integer.parseInt(customer));

        PaymentDAO paymentDAOImpl = new PaymentDaoImpl();

        JSONObject jSONObject = new JSONObject();
        jSONObject = paymentDAOImpl.saveInvoiceData(invoice);

        System.out.println("Invoice Id :" + jSONObject);
        response.getWriter().write(jSONObject.toString());

// Save data into invoice_item table
        
        //get the invoiceId
        String invoiceId = jSONObject.get("invoiceId").toString();
        System.out.println("invoiceId jsobj :"+invoiceId);
        response.sendRedirect("index.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}
