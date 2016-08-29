<%-- 
    Document   : addToCart
    Created on : May 3, 2016, 12:57:54 PM
    Author     : Iresh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>   
<script src="js/getAjaxObj.js"></script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>Sun Lanka (Pvt.)Ltd.</title>
    </head>
    <nav>
        <div class="row" style="background-color:  #999">
            <div class="col-sm-6" style="background-color:  #999;">
                <p class="h4" style="margin-left: 20px;"> Sun Lanka (Pvt.)Ltd.</p>
            </div>
            <div class="col-sm-4"  >
                <table class="table-responsive">
                    <tr>
                        <td>UserName</td>
                        <td><input type="text"></td>
                        <td>Password</td>
                        <td><input type="password"></td>
                        <td><input type="submit" value="login"></td>
                        <td><a href="registerCustomer.jsp">SignUp</a></td>
                    </tr>
                </table>
            </div>
        </div>
    </nav>
    <body class="container-fluid">
        <!--For Getting the Database Connection-->
        <sql:setDataSource var="opdmsdb" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/opdms_db" user="root" password="root" />
        <%--<sql:setDataSource var="opdmsdb" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/opdms_db" user="root" password="123" />--%>

        <div id="wrapper" data-spy="scroll" data-target="#myScrollspy" data-offset="15">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="nav sidebar-nav">
                    <!--                    <li class="sidebar-brand">
                    
                                        </li>
                                        <li>
                                            <a href="#"><i class="glyphicon glyphicon-alert"></i>Dashboard</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="glyphicon glyphicon-asterisk"></i>Place Order</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="glyphicon glyphicon-record"></i>User Permission Manager</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="glyphicon glyphicon-link"></i>Confirm Order</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="glyphicon glyphicon-hand-up"></i>Order Tracking</a>
                                        </li>
                                        <li>-->

                </ul>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="container">

                                <div class="row">
                                    <div class="col-lg-12" style="padding-top: 5px">
                                        <h1 class="page-header">Order Now..                                   
                                        </h1>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-7 table-responsive">
                                        <a href="#">
                                            <table class="table table-striped" id="view_sltd_item_tbl">

                                            </table>
                                        </a>
                                    </div>
                                    <div class="col-md-5">
                                        <table class="table table-striped" id="view_sltd_item_desc">

                                        </table>

                                        <!--<p>Whole sale Price : Rs35.00</p>-->
                                        <a class="btn btn-primary" href="#">Order Now<span class="glyphicon glyphicon-chevron-right"></span></a>
                                        <a class="btn btn-primary" href="#" onclick="addToCart2()">Add to Cart<span class="glyphicon glyphicon-chevron-right"></span></a>

                                    </div>
                                </div>

                                <hr>



                                <!--                                <div class="row">
                                
                                                                    <div class="col-md-7">
                                                                        <a href="#">
                                                                            <img src="images/freshMilk.jpg" style="width: 350px; height: 150px;">
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-md-5">
                                
                                <sql:query  var="availableQty" dataSource="${opdmsdb}">
                                    SELECT * FROM inventory_item where inventry_item_code='0004';
                                </sql:query>

                                <h3>Sun Fresh Milk</h3>
                                <h5>Quantity Available :</h5>
                                <c:forEach var="availableQuantity" items="${availableQty.rows}">   
                                    <input type="text" value="<c:out value="${availableQuantity.quantity_on_hand}"/> "disabled>
                                    <h3>Price : Rs <input type="text" value="<c:out value="${availableQuantity.unit_price}"/> "disabled ></h3>
                                </c:forEach>
                            <p>Whole sale Price : Rs80.00</p>
                            <a class="btn btn-primary" href="#">Add to Cart<span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                    </div>-->

                                <hr>

                                <div class="row text-center">
                                    <div class="col-lg-12">
                                        <ul class="pagination">
                                            <li>
                                                <a href="#">&laquo;</a>
                                            </li>
                                            <li class="active">
                                                <a href="#">1</a>
                                            </li>
                                            <li>
                                                <a href="#">2</a>
                                            </li>
                                            <li>
                                                <a href="#">3</a>
                                            </li>
                                            <li>
                                                <a href="#">4</a>
                                            </li>
                                            <li>
                                                <a href="#">5</a>
                                            </li>
                                            <li>
                                                <a href="#">&raquo;</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <hr>

                            </div>
                            <!-- /.container -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<script>

    var no_of_items_ct_glb = 0;

    $(document).ready(function () {

    <%String var = request.getParameter("param");
        session.setAttribute("item_code", var);
        System.out.println("var : " + var);
    %>

        var item_code = "<%=session.getAttribute("item_code")%>"
        alert("x in another : " + item_code);
        alert("Inside document.ready")

        getDataForItemCode(item_code)
    });

//Retrieving Data from DB for Selected item
    function getDataForItemCode(item_code) {

        alert("x in another db function : " + item_code);

        var xmlHttp = getAjaxObject();
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {

                var reply = eval('(' + xmlHttp.responseText + ')');

                if (reply.message) {
                    alert("Success");
                    var view_sltd_item_data = reply.viewSltdItmData; //get the JSONObject sent by the AddToCartController
                    viewForAddingToCart(view_sltd_item_data); //Calling the function by setting up the parameter
                } else {
                    alert("Failed");
                }
            }
        };
        xmlHttp.open("POST", "AddToCartController?actionType=getDataForItemCode&item_code=" + item_code, true);
        xmlHttp.send();
    }

//View More data to addToCart 
    function viewForAddingToCart(view_sltd_item_data) {


        var view_sltd_item_tbl = document.getElementById("view_sltd_item_tbl");
        var view_sltd_item_desc = document.getElementById("view_sltd_item_desc");

        //Table 1
        var itemTblHead = document.createElement("thead");
        var itemTblBody = document.createElement("tbody");

        var tblHeadR1 = document.createElement("tr");
        var tblItemR1 = document.createElement("tr");

        var tblHeadCol1 = document.createElement("td");
        tblHeadCol1.innerHTML = view_sltd_item_data.itemName;

        var tblItemR1C1 = document.createElement("img");
        tblItemR1C1.src = "/OPnDMS/img/" + view_sltd_item_data.imgUrl;
        tblItemR1C1.style.height = "225px";
        tblItemR1C1.style.width = "325px";


        tblHeadR1.appendChild(tblHeadCol1);
        tblItemR1.appendChild(tblItemR1C1);

        itemTblBody.appendChild(tblHeadR1);
        itemTblBody.appendChild(tblItemR1);
        view_sltd_item_tbl.appendChild(itemTblBody);

        //Table 2
        var itemDescTblHead = document.createElement("thead");
        var itemDescTblBody = document.createElement("tbody");

        var tblDescHeadR1Ct = document.createElement("tr");

        var tblDescHeadCol1Ct = document.createElement("td");
        tblDescHeadCol1Ct.innerHTML = "No of items in Cart : ";
        var tblDescHeadCol2Ct = document.createElement("INPUT");
        tblDescHeadCol2Ct.setAttribute("type", "text");
        tblDescHeadCol2Ct.id = "no_of_item_ct";
        tblDescHeadCol2Ct.name = "no_of_item_ct";
        tblDescHeadCol2Ct.value = no_of_items_ct_glb;

        var tblDescHeadR1 = document.createElement("tr");

        var tblDescHeadCol1 = document.createElement("td");
        tblDescHeadCol1.innerHTML = "Unit Price : ";
        var tblDescHeadCol2 = document.createElement("td");
        tblDescHeadCol2.innerHTML = "Rs " + view_sltd_item_data.itemUnitPrice + ".00";

        var tblDescItemR1 = document.createElement("tr");

        var tblDescItemR1C1 = document.createElement("td");
        tblDescItemR1C1.innerHTML = "Available Quantity : ";
        var tblDescItemR1C2 = document.createElement("td");
        tblDescItemR1C2.innerHTML = view_sltd_item_data.quantityOnHand;

        var tblDescItemR2 = document.createElement("tr");

        var tblDescItemR2C1 = document.createElement("td");
        tblDescItemR2C1.innerHTML = "Enter Your Quantity : ";
        var tblDescItemR2C2 = document.createElement("INPUT");
        tblDescItemR2C2.setAttribute("type", "text");

        tblDescHeadR1Ct.appendChild(tblDescHeadCol1Ct);
        tblDescHeadR1Ct.appendChild(tblDescHeadCol2Ct);

        tblDescHeadR1.appendChild(tblDescHeadCol1);
        tblDescHeadR1.appendChild(tblDescHeadCol2);

        tblDescItemR1.appendChild(tblDescItemR1C1);
        tblDescItemR1.appendChild(tblDescItemR1C2);

        tblDescItemR2.appendChild(tblDescItemR2C1);
        tblDescItemR2.appendChild(tblDescItemR2C2);

        itemDescTblBody.appendChild(tblDescHeadR1Ct);
        itemDescTblBody.appendChild(tblDescHeadR1);
        itemDescTblBody.appendChild(tblDescItemR1);
        itemDescTblBody.appendChild(tblDescItemR2);
        view_sltd_item_desc.appendChild(itemDescTblBody);
    }

    function addToCart2() {

        var x = document.getElementById("no_of_item_ct").value = ++no_of_items_ct_glb;
        alert(x);
    }
</script>

