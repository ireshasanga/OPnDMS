<%-- 
    Document   : navigation
    Created on : May 4, 2016, 11:26:42 PM
    Author     : Iresh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><img src="img/icons/company_logo.png" class="img-responsive" width="80px" style="margin-top: -16px;" /></a>
                    <a class="navbar-brand" href="#">Sun Lanka</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="#">About Us<span class="sr-only">(current)</span></a></li>
                        <li><a href="#">Products</a></li>
                        <li><a href="#">Contact</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <form class="navbar-form navbar-left" action="login">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="username" name="username">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="password" name="password">
                            </div>
                            <button type="submit" class="btn btn-success">Login</button>
                            <a href="registerCustomer.jsp">
                                <input type="button" value="Signup" name="Signup" class="btn btn-info"/>
                            </a>
                            <!--<button type="submit" class="btn btn-primary">Signup</button>-->
                            <div align="right">
                                <a href="#">
                                    <input type="button" value="Employee Login" name="emp_login" class="btn btn-link"/>
                                </a>
                            </div>
                        </form>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </body>
</html>
