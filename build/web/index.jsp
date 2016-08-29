<%-- 
    Document   : index
    Created on : May 3, 2016, 12:07:04 PM
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
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/opdms_db" user="root" password="root" var="dataSrc"/>
    </head>
    <body class="container">
        <form action="index.jsp" method="POST">
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="container">

                                <div class="row">
                                    <div class="col-lg-7" style="padding-top: 5px">
                                        <h1 class="page-header">Order Now..                                   
                                        </h1>
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="col-sm-2">
                                            <img src="img/icons/Add_to_Cart-512.png" onclick="javascrip: window.location = 'checkOut.jsp'" style="width: 50px; height: 50px; margin-top: 50px;"/>
                                        </div>
                                        <div class="col-sm-10">
                                            <input type="text" id="cartItems" name="cartItems" class="form-control" style="width: 200px; margin-top: 60px;" /></br>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-7">
                                        <select name="noOfItems" id="noOfItems" onchange="document.forms[0].submit();" class="form-control" style="width: 200px;">
                                            <option value="3" selected="selected">3</option>
                                            <option value="10">10</option>
                                            <option value="15">15</option>
                                            <option value="20">20</option>
                                        </select><br/>
                                        <%--<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/opdms_db" user="root" password="root" var="dataSrc"/>--%>

                                        <sql:query dataSource="${dataSrc}" var="itemQ">
                                            SELECT * FROM inventory_item ORDER BY inventry_item_id DESC
                                            <c:choose>
                                                <c:when test="${not empty param.noOfItems}">
                                                    LIMIT ${param.noOfItems};
                                                </c:when>
                                                <c:otherwise> LIMIT 3;</c:otherwise>
                                            </c:choose>
                                        </sql:query>
                                        <c:forEach items="${itemQ.rows}" var="row">
                                            <img src="img/${row.img_url}" alt="${row.inventry_item_code}" style="width: 250px; height: 200px;"/><br/><br/>
                                        </c:forEach>
                                    </div>
                                    </form>
                                    <div class="col-md-5">

                                        <input type="text" id="noOfItems" name="noOfItems" class="form-control" style="width: 200px;" /></br>
                                        <c:forEach items="${itemQ.rows}" var="row">
                                            <%--<img src="img/${row.img_url}" alt="${row.inventry_item_code}" style="width: 80px; height: 80px;"/><br/>--%>
                                            <h4>Item Code :<span id="itemCodeSpn">${row.inventry_item_code}</span></h4>
                                            <h4>Item Name :<b><span style="font-size: 20px" >${row.inventry_item_name}</span></b></h4>
                                            <h4>Available Quantity :<span>${row.quantity_on_hand}</span></h4>
                                            <h3>Unit Price Rs:<span>${row.unit_price}</span></h3>
                                            <h4>Order Quantity :<input type="text" name="${row.inventry_item_id}" id="${row.inventry_item_id}"/></h4>
                                            <form action="moreInfo.jsp" method="POST">
                                                <input type="hidden" id="item" name="item" value="${row.inventry_item_id}"/>
                                                <input type="submit" id="moreInfo" name="moreInfo" value="More info" class="btn btn-primary"/>
                                            </form>

                                            <input type="button" id="addToCart" name="addToCart" value="Add to Cart" onclick="te('${row.inventry_item_id}', '<%= session.getId()%>');" class="btn btn-primary" /><br /><br />       
                                        </c:forEach>
                                    </div>      
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <script type="text/javascript">
                <c:choose>
                    <c:when test="${not empty param.noOfItems}">
                var select = document.getElementById('noOfItems');
                for (var i = 0; i < select.options.length; i++) {
                    if (select.options[i].value == ${param.noOfItems}) {
                        select.selectedIndex = i;
                        break;
                    }
                }
                    </c:when>
                </c:choose>
            </script>
    </body>
</html>