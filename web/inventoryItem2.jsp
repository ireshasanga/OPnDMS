<%-- 
    Document   : inventoryItem2
    Created on : May 3, 2016, 5:52:59 PM
    Author     : Iresh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>Sun Lanka (Pvt.)Ltd.</title>
        <script type="text/javascript" src="js/opdms.js"></script>
    </head>
    <body class="container">       

        <!--For Getting the Database Connection-->
        <sql:setDataSource var="opdmsdb" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/opdms_db" user="root" password="root" />
        <%--<sql:setDataSource var="opdmsdb" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/opdms_db" user="root" password="123" />--%>
        <div class="row" style="background-color:  #999">
            <div class="col-sm-6" style="background-color:  #999;">
                <p class="h4" style="margin-left: 20px;"> Sun Lanka (Pvt.)Ltd.</p>
            </div>
            <div class="col-sm-4"  >
                <table class="table">
                    <tr>
                        <td>UserName</td>
                        <td><input type="text"></td>
                        <td>Password</td>
                        <td><input type="password"></td>
                        <td><input type="submit" value="login"></td>
                        <td><a href="register_customer.jsp">SignUp</a></td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- Page Content -->

        <!--Queries for retrieving data from DB-->

        <sql:query  var="ig" dataSource="${opdmsdb}">
            SELECT * FROM inventry_item_group ORDER BY inventry_item_group_name;
        </sql:query>

        <sql:query  var="it" dataSource="${opdmsdb}">
            SELECT * FROM inventry_item_type ORDER BY inventry_item_type_name;
        </sql:query>

        <sql:query  var="uoh" dataSource="${opdmsdb}">
            SELECT * FROM unit_of_handling ORDER BY unit_code;
        </sql:query>

        <sql:query  var="currency" dataSource="${opdmsdb}">
            SELECT * FROM currency ORDER BY currency_code;
        </sql:query>

        <form action="InventoryItemController" method="POST" enctype="multipart/form-data">
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row " >
                        <div class="col-lg-12 " style="padding-top: 50px">
                            <h2>Inventory Item Details</h2>

                            <div class="panel panel-default col-xs-10">
                                <div class="panel panel-body">
                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name">Item Type : </label>
                                        <div class="col-xs-5">
                                            <!--Retrieving data from db for Item Type-->                
                                            <select name="itemType" id="itemType" class="form-control">
                                                <option selected="selected">Select Type</option>
                                                <c:forEach var="row" items="${it.rows}">   
                                                    <option value="${row.inventry_item_type_id}" class="form-control">${row.inventry_item_type_name}</option>
                                                </c:forEach>
                                            </select>

                                            <!--<input type="text" class="form-control" placeholder="Enter Item Type ">-->
                                        </div> </br>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name">Item Group : </label>
                                        <div class="col-xs-5">
                                            <select name="itemGroup" id="itemGroup" class="form-control">
                                                <option selected="selected">Select Group</option>
                                                <c:forEach var="row" items="${ig.rows}">   
                                                    <option value="${row.inventry_item_group_id}">${row.inventry_item_group_name}</option>
                                                </c:forEach>
                                            </select>
                                        </div></br>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name">Item Code : </label>
                                        <div class="col-xs-5">
                                            <input type="text" class="form-control" placeholder="Enter Item Code" id="itemCode" name="itemCode">
                                        </div> </br>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name">Item Name : </label>
                                        <div class="col-xs-5">
                                            <input type="text" class="form-control" placeholder="Enter Item Name" id="itemName" name="itemName">
                                        </div> </br>
                                    </div>
                                </div>
                            </div>


                            <div class="panel panel-default col-xs-10">
                                <div class="panel panel-body">
                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name">UoH : </label>
                                        <div class="col-xs-5">

                                            <select name="unitOfHandling" id="unitOfHandling" class="form-control">
                                                <option selected="selected">UoH</option>
                                                <c:forEach var="row" items="${uoh.rows}">   
                                                    <option value="${row.id_unit_of_handling}">${row.unit_code}</option>
                                                </c:forEach>
                                            </select>

                                        </div> <br/>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name">Quantity On Hand : </label>
                                        <div class="col-xs-5">
                                            <input type="text" class="form-control" placeholder="Enter Quantity On Hand" value="0" id="quantityOnHand" name="quantityOnHand">
                                        </div> <br/>
                                    </div>
                                </div>


                            </div>

                            <div class="panel panel-default col-xs-10">
                                <div class="panel panel-body">
                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name"> Re-Order Level : </label>
                                        <div class="col-xs-5">
                                            <input type="text" class="form-control" placeholder="Enter Re-Order Level" value="0" id="reOrderLevel" name="reOrderLevel">
                                        </div> <br/>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name">Re-Order Quantity : </label>
                                        <div class="col-xs-5">
                                            <input type="text" class="form-control" placeholder="Enter Re-Order Quantity" value="0" id="reOrderQuantity" name="reOrderQuantity">
                                        </div> <br/>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name">Unit Price : </label>
                                        <div class="col-xs-5">
                                            <input type="text" class="form-control" placeholder="Enter Unit Price" value="0" id="unitPrice" name="unitPrice">
                                        </div> <br/>
                                    </div>
                                </div>

                            </div> 

                            <div class="panel panel-default col-xs-10">
                                <div class="panel panel-body">
                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name">Currency : </label>
                                        <div class="col-xs-5">
                                            <select name="currency" id="currency" class="form-control">
                                                <option selected="selected">Select Group</option>
                                                <c:forEach var="row" items="${currency.rows}">   
                                                    <option value="${row.currency_id}">${row.currency_name}</option>
                                                </c:forEach>
                                            </select>
                                        </div> <br/>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name">Selling Price : </label>
                                        <div class="col-xs-5">
                                            <input type="text" class="form-control" placeholder="Enter Supplier No." id="sellingPrice" name="sellingPrice">
                                        </div> <br/>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-xs-4 lbl_name">Item Description : </label>
                                        <div class="col-xs-5">
                                            <input type="text" class="form-control" placeholder="Enter Item Description." id="itemDesc" name="itemDesc">
                                        </div> <br/>
                                    </div>


                                    <div class="panel panel-default col-xs-10">
                                        <div class="panel panel-body">
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label class="control-label col-md-6 " for="file_sym">Upload Image:</label>
                                                    <div class="col-md-6 pull-right"> 
                                                        <input type="file" class="form-control" name="file_sym" id="file_sym">
                                                    </div>
                                                </div>
                                            </div>

                                            <div>
                                                <input type="reset" value="Clear" class="btn btn-primary" id="clear"/>
                                                <input type="submit" value="Delete" class="btn btn-primary" id="delete" onclick="setMethod('method', 'delete');"/>
                                                <input type="submit" value="Update" class="btn btn-primary" id="update" onclick="setMethod('method', 'update');"/>
                                                <input type="submit" value="Save" class="btn btn-primary" id="save" onclick="setMethod('method', 'save');"/>
                                                <!--<input type="submit" value="Save" class="btn btn-primary" id="save"/>-->
                                            </div>
                                        </div>

                                    </div> 

                                </div>
                            </div>

                        </div>               

                    </div>
                </div>
            </div>
            <input type="hidden" id="method" name="method">
        </form>
    </body>
</html>
