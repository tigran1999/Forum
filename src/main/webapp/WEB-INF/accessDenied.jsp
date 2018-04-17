
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Tigran
  Date: 09.04.2018
  Time: 23:32
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
    <link href="/1css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="/1css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Voguish Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900' rel='stylesheet' type='text/css'>
    <script src="/1js/jquery.min.js"></script>
    <link rel="stylesheet" href="/1css/flexslider.css" type="text/css" media="screen" />
    <script src="/1js/responsiveslides.min.js"></script>
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
<!-- 404 -->
<div class="container">
    <div class="main">
        <div class="error-404 text-center">
            <h1>403</h1>
            <p><spring:message key="accessdenied"/></p>
            <a class="b-home" href="/home"><spring:message key="backtohome"/></a>
        </div>
    </div>
    <!-- 404 -->

    <div class="footer">


        <div class="clearfix"> </div>
        <div class="copyright">
            <p>ArmForum© 2018</p>
        </div>
    </div>
</div>
</body>
</html>