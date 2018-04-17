
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="1css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="1css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Voguish Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Libre+Baskerville:400,700' rel='stylesheet' type='text/css'>
    <script src="1js/jquery.min.js"></script>
    <script src="1js/responsiveslides.min.js"></script>
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
            <a href="/home"><img src="images/logo.png" class="img-responsive" alt=""></a>
        </div>

        <div class="head-nav">
            <span class="menu"> </span>
            <ul class="cl-effect-1">
                <li class="active"><a href="/home"><spring:message key="main.menu.home"/></a></li>
                <li><a href="/blog"><spring:message key="main.menu.blog"/></a></li>

                <c:if test="${user.type.toString() == 'USER'}">
                    <li><a href="/myPage"><spring:message key="main.menu.mypage"/></a></li>
                </c:if>
                <c:if test="${user.type.toString() == 'ADMIN'}">
                    <li><a href="/admin"><spring:message key="main.menu.myadminpage"/></a></li>
                </c:if>
                <c:if test="${user == null}">
                    <li><a href="/loginPage"><spring:message key="main.menu.login"/></a></li>
                </c:if>
                <c:if test="${user != null}">
                    <li><a href="/logout"><spring:message key="main.menu.logout"/></a></li>
                </c:if>

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
<div class="container">
    <div class="col-md-9 bann-right">
        <!-- banner -->
        <div class="banner">
            <div class="header-slider">
                <div class="slider">
                    <div class="callbacks_container">
                        <ul class="rslides" id="slider">
                            <li>
                                <img src="../images/1.jpeg" class="img-responsive" alt="">
                            </li>
                            <li>
                                <img src="images/2.png" class="img-responsive" alt="">
                            </li>
                            <li>
                                <img src="images/3.jpg" class="img-responsive" alt="">
                            </li>
                            <li>
                                <img src="images/4.png" class="img-responsive" alt="">
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- banner -->
        <!-- nam-matis -->

        <div class="nam-matis">
            <div class="nam-matis-top">
                <div class="col-md-6 nam-matis-1">
                    <a href="/post/${fristPost.id}"><img src="/image?fileName=${fristPost.picUrl}" class="img-responsive" alt="" title="${fristPost.title}"></a>
                    <h3><a href="/post/${fristPost.id}">${fristPost.title}</a></h3>
                    <p>${fristPost.text}</p>
                </div>
                <div class="col-md-6 nam-matis-1">
                    <a href="/post/${secondPost.id}"><img src="/image?fileName=${secondPost.picUrl}" class="img-responsive" alt="" title="${secondPost.title}"></a>
                    <h3><a href="/post/${secondPost.id}">${secondPost.title}</a></h3>
                    <p>${secondPost.text}</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="nam-matis-top">
                <div class="col-md-6 nam-matis-1">
                    <a href="/post/${thirdPost.id}"><img src="/image?fileName=${thirdPost.picUrl}" class="img-responsive" alt="" title="${thirdPost.title}"></a>
                    <h3><a href="/post/${thirdPost.id}">${thirdPost.title}</a></h3>
                    <p>${thirdPost.text}</p>
                </div>
                <div class="col-md-6 nam-matis-1">
                    <a href="/post/${forthPost.id}"><img src="/image?fileName=${forthPost.picUrl}" class="img-responsive" alt="" title="${forthPost.title}"></a>
                    <h3><a href="/post/${forthPost.id}">${forthPost.title}</a></h3>
                    <p>${forthPost.text}</p>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- nam-matis -->
    </div>
    <div class="col-md-3 bann-left">
        <a href="/home?lang=hy" style="float: left;"><img src="/images/flag_am.gif"></a>
        <a href="/home?lang=ru" style="float: left;"><img src="/images/flag_ru.gif"></a>
        <a href="/home?lang=us"><img src="/images/flag_en.png"></a>
        <div class="b-search">
            <form action="/search">
                <input type="text" name="keyword">
                <input type="submit" value="">
            </form>
        </div>

        <h3><spring:message key="main.menu.categories"/></h3>
        <div class="blo-top">
            <c:forEach items="${allCategories}" var="category">
            <li><a href="/postByCategory/${category.id}">${category.name}</a></li>
            </c:forEach>
        </div>

    </div>
    <div class="clearfix"> </div>
    <div class="fle-xsel">
        <ul id="flexiselDemo3">
            <c:forEach items="${AllPosts}" var="post">
            <li>
                <a href="/post/${post.id}">
                    <div class="banner-1" >
                        <img src="/image?fileName=${post.picUrl}" class="img-responsive" alt="" name="hello" title="${post.title}">
                    </div>
                </a>
            </li>
            </c:forEach>
        </ul>

        <script type="text/javascript">
            $(window).load(function() {

                $("#flexiselDemo3").flexisel({
                    visibleItems: 5,
                    animationSpeed: 1000,
                    autoPlay: true,
                    autoPlaySpeed: 3000,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: true,
                    responsiveBreakpoints: {
                        portrait: {
                            changePoint:480,
                            visibleItems: 2
                        },
                        landscape: {
                            changePoint:640,
                            visibleItems: 3
                        },
                        tablet: {
                            changePoint:768,
                            visibleItems: 3
                        }
                    }
                });

            });
        </script>
        <script type="text/javascript" src="1js/jquery.flexisel.js"></script>
        <div class="clearfix"> </div>
    </div>
    <div class="footer">
        <div class="clearfix"> </div>
        <div class="copyright">
            <p>2018 ArmForum ©</p>
        </div>
    </div>
</div>
</body>
</html>