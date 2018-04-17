<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ArmForum Admin</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/datepicker3.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">

    <!--Custom Font-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#sidebar-collapse"><span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span></button>
            <a class="navbar-brand" href="#"><span>ArmForum</span>Admin</a>

        </div>
    </div><!-- /.container-fluid -->
</nav>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <div class="profile-sidebar">
        <div class="profile-userpic">

            <c:if test="${!user.picUrl.equals('')}">
                <img src="/image?fileName=${user.picUrl}" class="img-responsive">
            </c:if>
        </div>
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">${user.name} ${user.surname}</div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="divider"></div>

    <ul class="nav menu">
        <li><a href="/home"><em class="fa fa-home">&nbsp;</em>Home</a></li>
        <li><a href="/admin"><em class="fa fa-dashboard">&nbsp;</em> Admin Control</a></li>
        <li class="active"><a href="/admin/panel"><em class="fa fa-toggle-off">&nbsp;</em> Admin Panel</a></li>
        <li><a href="/logout"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>

    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">Admin Panel</li>
        </ol>
    </div><!--/.row-->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-md-6">
                        <span style="color: red">${message}</span>
                        <spring:form role="form" action="/admin/addPost" method="post" modelAttribute="post"
                                     enctype="multipart/form-data">
                            <h2>ADD POST</h2>
                            <div class="form-group">
                                <label>Title</label>
                                <spring:input path="title" cssClass="form-control" placeholder="Title"></spring:input>
                            </div>
                            <div class="form-group">
                                <label>Text</label>
                                <spring:textarea path="text" cssClass="form-control" rows="3" placeholder="Text" ></spring:textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <spring:select path="category" items="${allCategories}" itemLabel="name" cssClass="form-control"></spring:select>
                            </div>
                            <div class="form-group">
                                <label>File input</label>
                                <input type="file" name="image">
                            </div>
                            <button type="submit" class="btn btn-primary">Add Post</button>
                        </spring:form>

                    </div>
                    <div class="col-md-6">

                        <spring:form role="form" action="/admin/addCategory" method="post" modelAttribute="category">
                            <h2>ADD CATEGORY</h2>
                            <div class="form-group">
                                <label>Category name</label>
                                <spring:input path="name" cssClass="form-control" placeholder="Name"></spring:input>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Category</button>
                        </spring:form>

                    </div>

                </div>
            </div>
        </div><!-- /.panel-->
    </div><!-- /.col-->

</div><!-- /.row -->
</div><!--/.main-->

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/chart.min.js"></script>
<script src="/js/chart-data.js"></script>
<script src="/js/easypiechart.js"></script>
<script src="/js/easypiechart-data.js"></script>
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/custom.js"></script>

</body>
</html>

