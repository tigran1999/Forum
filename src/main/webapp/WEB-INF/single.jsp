
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
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
    <link href="../1css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="../1css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Voguish Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900' rel='stylesheet'
          type='text/css'>
    <script src="../1js/jquery.min.js"></script>
    <link rel="stylesheet" href="1css/flexslider.css" type="text/css" media="screen"/>
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
            $("span.menu").click(function () {
                $(".head-nav ul").slideToggle(300, function () {
                    // Animation complete.
                });
            });
        </script>
        <!-- script-for-nav -->


        <div class="clearfix"></div>
    </div>
</div>
<!-- header -->
<!-- content -->
<div class="container">
    <div class="content-top">

        <div class="single">
            <div class="single-top">
                <img src="/image?fileName=${post.picUrl}" class="img-responsive" alt="" title="${post.title}">

                <p class="sin">${post.text}</p>

                <div class="artical-links">
                    <ul>
                        <li>
                            <small></small>
                            <span>${post.timestamp}</span></li>
                        <li>
                            <small class="admin"></small>
                            <a href="/userPage/${post.user.id}"><span>${post.user.name} ${post.user.surname}</span></a></li>
                        <li>
                            <small class="no"></small>

                            <c:if test="${allComments != null}">
                            <span>${allComments.size()}</span>
                            </c:if>
                        <li>
                            <small class="posts"></small>
                            <span><spring:message key="view.count"/>(${viewCount})</span></li>
                    </ul>
                </div>

                <div class="respon">
                    <c:if test="${allComments.size()==0}">
                        <h2><spring:message key="not.comments"/></h2>
                    </c:if>
                    <c:if test="${allComments.size() != 0}">

                        <c:forEach items="${allComments}" var="comment">
                        <div class="strator">

                            <c:if test="${user.equals(comment.user)}">
                            <a href="/user/deleteComment/${comment.id}">X</a>
                            </c:if>
                            <a href="/userPage/${comment.user.id}"><h5>${comment.user.name} ${comment.user.surname}</h5></a>
                            <p>${comment.timestamp}</p>
                            <div class="strator-left">
                                <c:if test="${comment.user.picUrl.equals('')}">
                                    <img src="/images/co.png" class="img-responsive" >
                                </c:if>
                                <c:if test="${!comment.user.picUrl.equals('')}">
                                    <img src="/image?fileName=${user.picUrl}" class="img-responsive" >
                                </c:if>

                            </div>
                            <div class="strator-right">
                                <p class="sin">${comment.text}</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${user == null}">
                        <h2><spring:message key="sign.in.to.comment"/></h2>
                    </c:if>
                    <c:if test="${user != null}">
                    <div class="comment">
                        <springForm:form action="/user/addComment/${post.id}" method="post" modelAttribute="comment">
                            <springForm:textarea path="text"/>
                            <input type="submit" value="add a comment">
                        </springForm:form>
                    </div>
                    </c:if>
                </div>
            </div>
            <div class="blog-content-right">
                <div class="b-search">
                    <form action="/search">
                        <input type="text" name="keyword">
                        <input type="submit" value="">
                    </form>
                </div>
                <br>
                <h3><spring:message key="main.menu.categories"/></h3>
                <div class="blo-top">
                    <c:forEach items="${allCategories}" var="category">
                        <li><a href="/postByCategory/${category.id}">${category.name}</a></li>
                    </c:forEach>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- content -->
    <div class="fle-xsel">
        <ul id="flexiselDemo3">
            <c:forEach items="${AllPosts}" var="post">
                <li>
                    <a href="#">
                        <div class="banner-1">
                            <img src="/image?fileName=${post.picUrl}" class="img-responsive" alt="" name="hello">
                        </div>
                    </a>
                </li>
            </c:forEach>
        </ul>

        <script type="text/javascript">
            $(window).load(function () {

                $("#flexiselDemo3").flexisel({
                    visibleItems: 5,
                    animationSpeed: 1000,
                    autoPlay: true,
                    autoPlaySpeed: 3000,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: true,
                    responsiveBreakpoints: {
                        portrait: {
                            changePoint: 480,
                            visibleItems: 2
                        },
                        landscape: {
                            changePoint: 640,
                            visibleItems: 3
                        },
                        tablet: {
                            changePoint: 768,
                            visibleItems: 3
                        }
                    }
                });

            });
        </script>
        <script type="text/javascript" src="/1js/jquery.flexisel.js"></script>
        <div class="clearfix"></div>
    </div>
    <div class="footer">


        <div class="clearfix"></div>
        <div class="copyright">
            <p>ArmForum© 2018</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>