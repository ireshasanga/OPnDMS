<%-- 
    Document   : checkOut
    Created on : May 5, 2016, 8:48:44 PM
    Author     : Iresh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./navigation.jsp"%>

<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <c:if test="${not empty param.sesId && not empty param.itemId}">
            <sql:update dataSource="${dataSrc}">
                DELETE FROM cart WHERE inventory_item = ${param.itemId} AND session_id = '${param.sesId }';
            </sql:update>
        </c:if>
        <div id="page-content-wrapper">
            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/opdms_db" user="root" password="root" var="dataSrc"/>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="container">

                            <div class="row">
                                <h4> Your Cart</h4><br/>

                                <div  class="panel panel-default panel panel-primary" style="padding-left: 15px; padding-right: 15px;">
                                    <div class="table-responsive">

                                        <sql:query dataSource="${dataSrc}" var="itemQ">
                                            SELECT c.order_quantity, i.quantity_on_hand, i.unit_price, i.img_url, i.inventry_item_code, i.inventry_item_id,
                                            (i.unit_price * c.order_quantity) AS 'order_value' FROM cart c 
                                            JOIN inventory_item i ON c.inventory_item = i.inventry_item_id
                                            WHERE c.session_id = '<%=request.getSession().getId()%>';
                                        </sql:query>

                                        <c:set var="totalValue" value="0" />
                                        <c:forEach items="${itemQ.rows}" var="row">
                                            <table class="table table-striped">
                                                <tr>
                                                    <td>
                                                        <form action="checkOut.jsp" method="POST">
                                                            <input type="hidden" id="itemId" name="itemId" value="${row.inventry_item_id}"/>
                                                            <input type="hidden" id="sesId" name="sesId" value="<%=request.getSession().getId()%>"/>
                                                            <button type="submit">X</button>
                                                        </form>
                                                    </td>
                                                    <td>
                                                        <img src="img/${row.img_url}" alt="${row.inventry_item_code}" style="width: 250px; height: 200px;"/>
                                                    </td>
                                                    <td>
                                                        <h4>Order Quantity :<input value="${row.order_quantity}" style="alignment-adjust: middle;"/></h4>
                                                        <h4>Quantity On Hand :<input type="text" id="qtOnHnd" name="qtOnHnd" value="${row.quantity_on_hand}"/></h4>
                                                        <h4>Unit Price :<input type="text" id="up" name="up" value="${row.unit_price}"/></h4>
                                                        <h4>Total Price :<input type="text" value="${row.order_value};"/></h4>

                                                        <c:set var="totalValue" value="${totalValue+row.order_value}" />

                                                        <br/>

                                                    </td>
                                                </tr>
                                            </table>
                                        </c:forEach>
                                        <form action="pay.jsp" method="POST">
                                            <input type="hidden" id="customer" name="customer" value="<%=session.getAttribute("cusId")%>"/>
                                            <input type="hidden" id="total" name="total" value="${totalValue}"/>
                                            <input type="submit" value="Checkout" class="btn btn-primary"/>
                                        </form>
                                        <br/>
                                    </div>
                                </div>



                            </div>                

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
