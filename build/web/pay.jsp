<%-- 
    Document   : pay
    Created on : May 5, 2016, 11:05:09 PM
    Author     : Iresh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./navigation.jsp"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/opdms.js" type="text/javascript"></script>
        <script src="js/opdms.js" type="text/javascript"></script>
        <script src="js/getAjaxObj.js" type="text/javascript"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/opdms_db" user="root" password="root" var="dataSrc"/>
        <sql:query dataSource="${dataSrc}" var="customerQ">
            SELECT CONCAT(c.c_first_name, c.c_last_name) AS 'customer_name', 
            CONCAT(a.address_line_one, a.address_line_two, a.address_line_three, d.country_name) AS 'adddress',
            c.prefered_currency AS 'currency'
            FROM customer c 
            JOIN address a ON a.customer = c.id_customer
            JOIN country d ON a.country = d.id_country
            WHERE c.id_customer = <%=session.getAttribute("cusId")%> AND a.address_type = 2;
        </sql:query>

        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="container">

                            <div class="row">

                                <c:forEach items="${customerQ.rows}" var="row">
                                    Customer : ${row.customer_name}
                                    Address :<input type="text" id="addressInpt" name="addressInpt" value="${row.adddress}" style="width: 300px;"> <br/>
                                    <input type="hidden" id="crncyGetVal" name="crncyGetVal" value=${row.currency}/>
                                    <input type="hidden" id="cusName" name="cusName" value="${row.customer_name}"/>
                                </c:forEach>
                                Items<br/>
                                <sql:query dataSource="${dataSrc}" var="itemQ">
                                    SELECT c.inventory_item, c.order_quantity, i.quantity_on_hand, i.unit_price, i.img_url, i.inventry_item_code,i.inventry_item_name,
                                    (i.unit_price * c.order_quantity) AS 'order_value' FROM cart c 
                                    JOIN inventory_item i ON c.inventory_item = i.inventry_item_id
                                    WHERE c.session_id = '<%=request.getSession().getId()%>';
                                </sql:query>
                                <c:forEach items="${itemQ.rows}" var="row">
                                    <div  class="panel panel-default panel panel-primary" style="padding-left: 15px; padding-right: 15px;">
                                        <div class="table-responsive">
                                            <table class="table table-striped" id="itemsTable">
                                                <thead>
                                                <th>
                                                <h4>Image</h4>
                                                </th>
                                                <th>
                                                <h4>Order Quantity</h4>
                                                </th>
                                                <th>
                                                <h4>Quantity on Hand</h4>
                                                </th>
                                                <th>
                                                <h4>Unit Price</h4>
                                                </th>
                                                <th>
                                                <h4>Order Value</h4>
                                                </th>

                                                </thead>
                                                <tbody>
                                                    <tr>

                                                        <td><img src="img/${row.img_url}" alt="${row.inventry_item_code}" style="width: 100px; height: 80px;"/></td>

                                                        <td>${row.order_quantity}</td>
                                                        <td>${row.quantity_on_hand}</td>
                                                        <td>${row.unit_price}</td>
                                                        <td>${row.order_value}</td>
                                                        <td style="display: none;">${row.inventory_item}</td>
                                                        <td style="display: none;">${row.inventry_item_name}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <br/>
                                </c:forEach>
                                <h3>Total Value :<input type="text" id="total" name="total" value="${param.total}"/></h3>
<!--                                <form action="pay.jsp" method="POST">
                                    <input type="hidden" id="customer" name="customer" value="1"/>
                                </form>-->
                                <form action="PaymentController" method="POST" onsubmit="return validatePayment();">
                                    <input type="hidden" id="customer" name="customer" value="<%=session.getAttribute("cusId")%>"/>
                                    <input type="hidden" id="items" name="items"/>
                                    <input type="hidden" id="address" name="address"/>
                                    <input type="hidden" id="currency" name="currency"/>
                                    <input type="hidden" id="customerName" name="customerName"/>
                                    <input type="submit" value="Pay" class="btn btn-primary"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
