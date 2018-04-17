<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Tigran
  Date: 20.03.2018
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
    <title>ArmForum</title>
    <link href="../1css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="../1css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Voguish Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900' rel='stylesheet' type='text/css'>
    <script src="../1js/jquery.min.js"></script>
    <link rel="stylesheet" href="/1css/flexslider.css" type="text/css" media="screen" />
    <script src="../1js/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
    </script>

</head>
<body>
<!-- header -->
<div class="header">
    <div class="container">
        <div class="logo">
            <a href="/home"><img src="../images/logo.png" class="img-responsive" alt=""></a>
        </div>

        <div class="head-nav">
            <span class="menu"> </span>
            <ul class="cl-effect-1">
                <li class="active"><a href="/home"><spring:message key="main.menu.home"/></a></li>
                <li><a href="/blog"><spring:message key="main.menu.blog"/></a></li>
                <li><a href="/register"><spring:message key="main.login.register"/></a></li>


                <div class="clearfix"></div>
            </ul>
        </div>
        <!-- script-for-nav -->
        <script>
            $( "span.menu" ).click(function() {
                $( ".head-nav ul" ).slideToggle(300, function() {
                    // Animation complete.
                });
            });
        </script>
        <!-- script-for-nav -->

        <div class="clearfix"> </div>


    </div>
</div>
<!-- header -->
<!-- login -->
<div class="container">
    <div class="login-page">

        <div class="account_grid">
            <div class="col-md-6 login-left wow fadeInLeft" data-wow-delay="0.4s">
                <h3><spring:message key="main.login.customers"/></h3>
                <p><spring:message key="main.login.desc"/></p>
                <a class="acount-btn" href="/register"><spring:message key="main.login.createAnAccount"/></a>
            </div>
            <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
                <h3><spring:message key="main.login.regedCustomers"/></h3>
                <p><spring:message key="main.login.regedDesc"/></p>
                <form action="/loginPage" method="post" name="loginPage">
                    <div>
                        <span><spring:message key="main.login.emailAddress"/><label>*</label></span>
                        <input type="text" name="email">
                    </div>
                    <div>
                        <span><spring:message key="main.login.password"/><label>*</label></span>
                        <input type="password" name="password">
                    </div>
                    <a class="forgot" href="/forgotPassword"><spring:message key="main.login.forgotPassword"/></a>
                    <input type="submit" value=<spring:message key="sign.in"/>>
                </form>
                <c:if test="${error}">
                    <span style="color: red">Email or password is not correct</span>
                </c:if>
                <span style="color: red">${message}</span>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>

    <!-- login -->


    <div class="footer">


        <div class="clearfix"> </div>
        <div class="copyright">
            <p>ArmForum© 2018</p>
        </div>
    </div>
</div>
</body>
</html>