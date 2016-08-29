<%-- 
    Document   : login
    Created on : May 7, 2016, 1:07:31 AM
    Author     : Iresh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
        <!--<script type="text/javascript" src="opdms.js"></script>-->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css" >

    <body>
        <div class="login-page">
            <div class="container" style="margin-top: 100px;">
                <div class="row center-block">
                    <div class="jumbotron col-md-6 col-md-offset-3">
                        <form action="login">
                            <div class="form-group">
                                <h4>Enter Username :<input name="username" class="form-control" type="text" placeholder="username"/></h4>
                            </div>
                            <div class="form-group">
                                <h4>Enter Password :<input name="password" class="form-control" type="password" placeholder="password"/></h4>
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-primary " value="LOGIN" style="width: 300px;"/>
                            </div>
                        </form>
                        <form action="registerCustomer.jsp">
                            <div class="form-group ">
                                <input type="submit" class="btn btn-primary " value="Signup" style="width: 300px;"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
