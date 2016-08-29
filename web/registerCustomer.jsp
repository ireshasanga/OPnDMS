<%-- 
    Document   : registerCustomer
    Created on : May 3, 2016, 1:01:12 PM
    Author     : Iresh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./navigation.jsp"%>
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
        <script></script>
    </head>
    <body class="container-fluid">
        <form action="RegisterController" method="post">   
            <div class="panel panel-info">
                <div id="techTab" class="panel-heading"><a data-toggle="" href="#">Customer Registeration Form</a></div>
                <div class="panel-body" id="" style="padding-right: 50px;">
                    <div class="raw center-block" style="padding-right: 50px;">
                        <div class="form-group">
                            <label class="control-label col-xs-5 lbl_name">First Name : </label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" name="first_name" id="first_name" placeholder="First Name">
                            </div> <br/>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5 lbl_name">Last Name : </label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" name="last_name" id="last_name" placeholder="Last Name">
                            </div> <br/>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5 lbl_name">Email : </label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" name="email" id="email" placeholder="Email ">
                            </div> <br/>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5 lbl_name">Currency : </label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" name="currency" id="currency" placeholder="Currency ">
                            </div> <br/>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5 lbl_name">Username : </label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" name="username" id="username" placeholder="Enter Username ">
                            </div> <br/>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5 lbl_name">Password : </label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" name="password" id="password" placeholder="Enter Passwprd ">
                            </div> <br/>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5 lbl_name">User Type : </label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" name="userType" id="userType" placeholder="Enter Passwprd ">
                            </div> <br/>
                        </div>
                        <div class="raw" style="padding-right: 50px;">
                            <div class="form-group">
                                <div class="col-xs-9">           
                                    <input type="submit" class="btn btn-info" id='click' value="Save"/>  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
