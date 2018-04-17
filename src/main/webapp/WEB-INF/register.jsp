
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>


<%--
  Created by IntelliJ IDEA.
  User: Tigran
  Date: 20.03.2018
  Time: 16:37
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
<div class="container">
    <div class="header">
        <div class="logo">
            <a href="/home"><img src="/images/logo.png" class="img-responsive" alt=""></a>
        </div>

        <div class="head-nav">
            <span class="menu"> </span>
            <ul class="cl-effect-1">
                <li class="active"><a href="/home"><spring:message key="main.menu.home"/></a></li>
                <li><a href="/blog"><spring:message key="main.menu.blog"/></a></li>


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
<!-- registration -->
<div class="container">
    <div class="main-1">

        <div class="register">
            <springForm:form action="/register" method="post" modelAttribute="user" enctype="multipart/form-data" >
                <div class="register-top-grid">
                    <h3><spring:message key="main.register.personalinf"/></h3>
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span><spring:message key="main.register.name"/><label>*</label></span>
                        <springForm:input type="text" path="name" id ="name"/>
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span><spring:message key="main.register.surname"/><label>*</label></span>
                        <springForm:input type="text" path="surname" id ="surname"/>
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span><spring:message key="main.register.profilePicture"/><label>*</label></span>
                        <input type="file" name="image">
                    </div>
                    <div class="clearfix"> </div>
                    <a class="news-letter" href="#">
                    </a>
                </div>
                <div class="register-bottom-grid">
                    <h3><spring:message key="main.register.loginInf"/></h3>
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span><spring:message key="blog.forgotPassword.email"/><label>*</label></span>
                        <springForm:input type="text" path="email" id ="email"/>
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span><spring:message key="main.login.password"/><label>*</label></span>
                        <springForm:input type="password" path="password" id ="password"/>
                    </div>
                </div>
                <div class="register-but">
                    <input type="submit" value="submit" class="acount-btn" />
                </div>
                <span style="color: red">${message}</span>
            </springForm:form>



            <div class="clearfix"> </div>


        </div>
    </div>
    <!-- registration -->

    <div class="footer">


        <div class="clearfix"> </div>
        <div class="copyright">
            <p>Copyrights © 2015 Voguish All rights reserved | Template by <a href="http://w3layouts.com/">W3layouts</a></p>
        </div>
    </div>
</div>
</body>
</html>
