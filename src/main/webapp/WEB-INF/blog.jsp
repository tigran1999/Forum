
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<!-- Blog -->
<div class="container">
    <div class="blog">

        <div class="blog-content">
            <div class="blog-content-left">
                <div class="blog-articals">
                <c:if test="${posts.size()==0}">
                    <h2><spring:message key="main.blog.searchNotResult"/></h2>
                </c:if>

                <c:forEach items="${posts}" var="post">
                    <div class="blog-artical">
                        <div class="blog-artical-info">
                            <div class="blog-artical-info-img">
                                <a href="/post/${post.id}"><img src="/image?fileName=${post.picUrl}" title="${post.title}"></a>
                            </div>
                            <div class="blog-artical-info-head">
                                <h2><a href="/post/${post.id}">${post.title}</a></h2>
                                <h6><spring:message key="main.blog.postedOn"/> ${post.timestamp} by <a href="/userPage/${post.user.id}">${post.user.name} ${post.user.surname}</a></h6>
                            </div>
                            <div class="blog-artical-info-text">
                                <p>${post.text}</p>
                            </div>
                            <div class="artical-links">
                                <ul>
                                    <li><small> </small><span>${post.timestamp}</span></li>
                                    <li><small class="admin"> </small><span>${post.user.name} ${post.user.surname}</span></li>
                                    <li><small class="no"> </small><span>${post.commentCount}</span></li>
                                    <li><a href="#"><small class="posts"> </small><span><spring:message key="view.count"/>(${post.viewCount})</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    </c:forEach>
                    <div class="rep">
                        <a href="/blog/${posts.size()+5}" class="reply"><spring:message key="main.blog.more"/></a>
                    </div>
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
                <br>
                <h3>&nbsp <spring:message key="main.menu.categories"/></h3>
                <div class="blo-top">
                    <c:forEach items="${allCategories}" var="category">
                    <li><a href="/postByCategory/${category.id}">${category.name}</a></li>
                    </c:forEach>
                </div>

            </div>
            <div class="clearfix"> </div>

        </div>
    </div>
    <!-- /Blog -->

    <div class="footer">


        <div class="clearfix"> </div>
        <div class="copyright">
            <p>ArmForum©</p>
        </div>
    </div>
</div>
</body>

</html>