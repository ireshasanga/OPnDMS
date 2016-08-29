<%-- 
    Document   : moreInfo
    Created on : May 5, 2016, 7:02:29 PM
    Author     : Iresh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./navigation.jsp"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Order now...</title>
        <script src="js/opdms.js" type="text/javascript"></script>
        <script src="js/getAjaxObj.js" type="text/javascript"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <%--<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/opdms_db" user="root" password="123" var="dataSrc"/>--%>

    </head>
    <body class="container">
    <body class="container">
        <form action="index.jsp" method="POST">
            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/opdms_db" user="root" password="root" var="dataSrc"/>
            <c:if test="${not empty param.item}">
                <sql:query dataSource="${dataSrc}" var="itemQ">
                    SELECT * FROM inventory_item WHERE inventry_item_id = ${param.item};
                </sql:query>
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="container">

                                    <div class="row">
                                        <div  class="panel panel-default panel panel-primary" style="padding-left: 15px; padding-right: 15px;">
                                            <div class="table-responsive">
                                                <table class="table table-striped">
                                                    <tr>
                                                        <td>
                                                            <img src="img/icons/Add_to_Cart-512.png" onclick="javascrip: window.location = 'checkOut.jsp'" style="width: 50px; height: 50px; margin-top: 50px;"/>
                                                        </td>
                                                        <td>
                                                            <c:forEach items="${itemQ.rows}" var="row">
                                                            <td>
                                                                <img src="img/${row.img_url}" alt="${row.inventry_item_code}" style="width: 350px; height: 250px;"/><br/>
                                                            </td>
                                                            <td>

                                                                <%--<img src="img/${row.img_url}" alt="${row.inventry_item_code}" style="width: 80px; height: 80px;"/><br/>--%>
                                                                <h4>Item Code :<span id="itemCodeSpn">${row.inventry_item_code}</span></h4>
                                                                <h4>Item Name :<b><span style="font-size: 20px" >${row.inventry_item_name}</span></b></h4>
                                                                <h4>Available Quantity :<span>${row.quantity_on_hand}</span></h4>
                                                                <h3>Unit Price Rs:<span>${row.unit_price}</span></h3>
                                                                <h4>Order Quantity :<input type="text" name="${row.inventry_item_id}" id="${row.inventry_item_id}"/></h4>
                                                                <input type="submit" formaction="moreInfo.jsp" id="moreInfo" name="moreInfo" value="More info" onclick="viewMoreInfo('${row.inventry_item_id}');" class="btn btn-primary"/>
                                                                <input type="button" id="addToCart" name="addToCart" value="Add to Cart" onclick="te('${row.inventry_item_id}', '<%= session.getId()%>');" class="btn btn-primary" /><br /><br />       
                                                            </td>
                                                        </c:forEach> 
                                                        </td>
                                                    </tr>

                                                </c:if>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                        </body>
                        </html>