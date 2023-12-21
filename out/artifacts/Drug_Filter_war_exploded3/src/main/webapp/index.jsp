<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/12/2021
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>



<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Signin | Gull Admin Template</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet">

</head>



<div class="auth-layout-wrap" >
    <div class="auth-content">
        <div class="card o-hidden">

            <div class="col-md-6 ml-auto mr-auto">
                <div class="p-4">
                    <div class="auth-logo text-center mb-4"><img src="dist-assets/images/dlf.pt-plus-sign-png-110969.png" alt=""></div>
                    <h1 class="mb-3 text-18">Sign In</h1>
                    <form action="controller/LoginController.jsp">
                        <div class="form-group">
                            <label for="email">User Name</label>
                            <input class="form-control form-control-rounded" id="email" name="email" type="text">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input class="form-control form-control-rounded" name="password" id="password" type="password">
                        </div>
                        <button class="btn btn-rounded btn-primary btn-block mt-2">Sign In</button>
                        <input hidden name="action" value="login">
                    </form>
                    <div >
                        <div class="mt-3 text-left"><a class="text-muted" href="forgotPassword.jsp">
                            <u>Forgot Password?</u></a></div>
                        <div class="mt-3 text-right" style="margin-top: -20px !important;"><a  class="text-muted" href="register.jsp">
                            <u>Register</u></a></div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
