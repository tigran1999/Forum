
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Tigran
  Date: 29.03.2018
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>ArmForum</title>
    <link href="/1css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="/1css/style.css" rel="stylesheet" type="text/css" media="all"/>
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
    <link rel="stylesheet" href="/1css/flexslider.css" type="text/css" media="screen"/>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- header -->
<div class="container">
    <div class="header">
        <div class="logo">
            <a href="/home"><img src="images/logo.png" class="img-responsive" alt=""></a>
        </div>
        <div class="head-nav">
            <span class="menu"> </span>
            <ul class="cl-effect-1">
                <li class="active"><a href="/home"><spring:message key="main.menu.home"/></a></li>
                <li><a href="/blog"><spring:message key="main.menu.blog"/></a></li>
                <c:if test="${user == null}">
                    <li><a href="/loginPage"><spring:message key="main.menu.login"/></a></li>
                </c:if>
                <c:if test="${user != null}">
                    <li><a href="/logout"><spring:message key="main.blog.logout"/></a></li>
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
<div class="container">

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><spring:message key="main.mypage.addPost"/></h4>
                </div>
                <div class="modal-body" id="my_popup">
                    <springForm:form role="form" action="/user/addPost" method="post" modelAttribute="post"
                                     enctype="multipart/form-data">

                        <div class="form-group">
                            <label><spring:message key="main.mypage.title"/></label>
                            <springForm:input path="title" cssClass="form-control" placeholder="Title"
                                              id="title"></springForm:input>
                        </div>
                        <div class="form-group">
                            <label> <spring:message key="main.mypage.text"/> </label>
                            <springForm:textarea path="text" cssClass="form-control" rows="3" placeholder="Text"
                                                 id="text"></springForm:textarea>
                        </div>
                        <div class="form-group">
                            <label><spring:message key="main.mypage.category"/></label>
                            <springForm:select path="category" items="${allCategories}" itemLabel="name"
                                               cssClass="form-control"></springForm:select>
                        </div>
                        <div class="form-group">
                            <label><spring:message key="main.mypage.choosephoto"/></label>
                            <input type="file" name="image">
                        </div>
                        <input type="submit" class="addPost"  value="<spring:message key="main.mypage.addPost"/>"/>

                    </springForm:form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="addPost" data-dismiss="modal"><spring:message key="main.mypage.close"/></button>
                </div>
            </div>

        </div>
    </div>

</div>
<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><spring:message key="main.mypage.edit"/></h4>
            </div>
            <div class="modal-body">
                <form role="form" action="/user/updateUser" method="post"
                      enctype="multipart/form-data">

                    <div class="form-group">
                        <label><spring:message key="main.register.name"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                        <input cssClass="form-control" value="${user.name}" name="name"></input>
                    </div>
                    <div class="form-group">
                        <label><spring:message key="main.register.surname"/></label>
                        <input cssClass="form-control" value="${user.surname}" name="surname"></input>
                    </div>


                    <div class="form-group">
                        <label><spring:message key="main.mypage.choosephoto"/></label>
                        <input type="file" name="image">
                    </div>
                    <button type="button" data-toggle="modal" data-target="#myModal2" class="edit" id="change">
                        <spring:message key="main.mypage.changePassword"/>
                    </button>
                    <input type="submit" class="addPost" onclick="myFunction()" value="SAVE"/>
                    <p id="demo"></p>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="addPost" data-dismiss="modal"><spring:message key="main.mypage.close"/></button>
            </div>
        </div>

    </div>
</div>
<div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><spring:message key="main.mypage.changePassword"/></h4>
            </div>
            <div class="modal-body">
                <form role="form" action="/user/changePassword" method="post">

                    <div class="form-group">
                        <label><spring:message key="main.mypage.oldPassword"/></label>
                        <input type="Password"  cssClass="form-control" name="old"/>
                    </div>
                    <div class="form-group">
                        <label><spring:message key="main.mypage.newPassword"/></label>
                        <input type="Password"  cssClass="form-control" name="new"/>
                    </div>
                    <input type="submit" class="addPost"  value="SAVE"/>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="addPost" data-dismiss="modal"><spring:message key="main.mypage.close"/></button>
            </div>
        </div>

    </div>
</div>
<script>
    function myFunction() {
        var x, text;
        x = document.getElementById("input1").value;
        if (isNaN(x)) {
            text = "Input not valid";
            $('#my_popup').popup('show');
        }
        document.getElementById("demo").innerHTML = text;
    }
</script>
</div>
<!-- header -->
<div class="container">
    <div class="contact">
        <div class="main-head-section">


            <div class="myProff">
                <div class="userPoto">
                    <%--<c:if test="${user.picUrl==null}">--%>
                    <%--<img src="/images/co.png" class="ss">--%>
                    <%--</c:if>--%>
                    <c:if test="${user.picUrl.equals('')}">
                        <img src="/images/co.png" class="ss">
                    </c:if>
                    <c:if test="${!user.picUrl.equals('')}">
                        <img src="/image?fileName=${user.picUrl}" class="ss">
                    </c:if>


                </div>
                <div class="bsttom">
                    <button type="button" data-toggle="modal" data-target="#myModal" class="addPost" id="add"><spring:message key="main.mypage.addPost"/>
                    </button>
                    <button type="button" data-toggle="modal" data-target="#myModal1" class="edit" id="edit">
                        <spring:message key="main.mypage.edit"/>
                    </button>

                </div>
                <div class="userName">
                    <span>${user.name}</span>
                    <span>${user.surname}</span>

                </div>
                <br><br> <span style="color: red">${message}</span>

            </div>
            <c:forEach items="${posts}" var="post">
                <div class="blog-artical">

                    <div class="blog-artical-info">
                        <div class="blog-artical-info-img">
                            <c:if test="${post.picUrl==null}">
                                <a href="/post/${post.id}"><img src="/images/8.jpg" title="post-name"></a>
                            </c:if>
                            <c:if test="${post.picUrl!=null}">
                                <a href="/post/${post.id}"><img src="/image?fileName=${post.picUrl}" title="post-name"></a>
                            </c:if>

                        </div>
                        <div class="blog-artical-info-head">
                            <h2><a href="/post/${post.id}">${post.title}</a></h2>
                            <h6><spring:message key="main.blog.postedOn"/> ${post.timestamp} by <a href="#">${post.user.name} ${post.user.surname}</a>
                            </h6>
                        </div>

                        <div class="artical-links">
                            <ul>
                                <li><a href="#">
                                    <small class="admin"></small>
                                    <span>${post.user.name} ${post.user.surname}</span></a></li>
                                <li><a href="#">
                                    <small class="no"></small>
                                    <span><spring:message key="main.mypage.comments"/>(${post.commentCount})</span></a></li>
                                <li><a href="#">
                                    <small class="posts"></small>
                                    <span><spring:message key="main.page.view"/> (${post.viewCount})</span></a></li>

                                <a href="/user/deletePost/${post.id}" type="button" class="close" data-dismiss="modal"><spring:message key="main.page.delete"/></a>
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </c:forEach>


        </div>

        <div class="contact_top">


            <div class="clearfix"></div>

        </div>
    </div>
    <div class="footer">

        <div class="clearfix"></div>
        <div class="copyright">
            <p>Copyrights © 2015 Voguish All rights reserved | Template by <a href="http://w3layouts.com/">W3layouts</a>
            </p>
        </div>
    </div>
</div>
<script src="/1js/script.js"></script>
</body>
</html>