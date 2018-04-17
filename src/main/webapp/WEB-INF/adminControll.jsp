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
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only"></span>
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
            <img src="/image?fileName=${user.picUrl}" class="img-responsive" alt="">
        </div>
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">${user.name} ${user.surname}</div>

        </div>
        <div class="clear"></div>
    </div>
    <div class="divider"></div>

    <ul class="nav menu">
        <li><a href="/home"><em class="fa fa-toggle-off">&nbsp;</em>Home</a></li>
        <li class="active"><a href="/admin"><em class="fa fa-dashboard">&nbsp;</em>Admin Controll</a></li>

        <li><a href="/admin/panel"><em class="fa fa-toggle-off">&nbsp;</em>Admin Panel</a></li>

        <li><a href="/logout"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">Admin Controll</li>
        </ol>
    </div><!--/.row-->



    <div class="panel panel-container">
        <div class="row">

            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-blue panel-widget border-right">
                    <div class="row no-padding"><em class="fa fa-xl fa-comments color-orange"></em>
                        <div class="large">${allPosts.size()}</div>
                        <div class="text-muted">All Posts</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-orange panel-widget border-right">
                    <div class="row no-padding"><em class="fa fa-xl fa-users color-teal"></em>
                        <div class="large">${allUsers.size()}</div>
                        <div class="text-muted">All Users</div>
                    </div>
                </div>
            </div>

        </div><!--/.row-->
    </div>




    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Edite Profile

                    <span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
                <div class="panel-body">
                    <form action="/admin/updateUser" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Name</label>
                            &nbsp &nbsp &nbsp<input type="text" cssClass="form-control" placeholder="Title"/>
                        </div>
                        <div class="form-group">
                            <label>Surname</label>
                            <input type="text" name=""cssClass="form-control" rows="3" placeholder="Text"/>
                        </div>

                        <div class="form-group">
                            <label>File input</label>
                            <input type="file" name="image">
                        </div>
                        <button type="submit" class="btn btn-primary">Edite Profile</button>
                    </form>
                </div>
            </div>


            <div class="panel panel-default">
                <div class="panel-heading">
                    Change Password
                    <span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
                <div class="panel-body">

                    <form action="/admin/changePassword" method="post">
                        <div class="form-group">
                            <label>Old Password</label>
                            &nbsp &nbsp &nbsp<input type="Password" cssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label>New Password</label>
                            <input type="Password" name=""cssClass="form-control" rows="3" />
                        </div>
                        <button type="submit" class="btn btn-primary">Change Password</button>
                    </form>

                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    Categories

                    <span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
                <div class="panel-body">
                    <ul class="todo-list">
                        <li class="todo-list-item">
                            <div class="checkbox">
                                <p  for="checkbox-1">Name</p>
                            </div>
                        </li>
                        <c:forEach items="${allCategories}" var="category">
                            <li class="todo-list-item">
                                <div class="checkbox">

                                    <a href="#" for="checkbox-1">${category.name}</a>

                                </div>
                                <div class="pull-right action-buttons"><a href="/deleteCategory/${category.id}" class="trash">
                                    <em class="fa fa-trash"></em>
                                </a></div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

        </div><!--/.col-->


        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Posts
                    <span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
                <div class="panel-body">
                    <ul class="todo-list">
                        <li class="todo-list-item">
                            <div class="checkbox">
                                <p  for="checkbox-1">Title &nbsp; Categroy &nbsp; User Email</p>
                            </div>
                        </li>
                        <c:forEach items="${allPosts}" var="post">
                        <li class="todo-list-item">
                            <div class="checkbox">
                                    <a href="#" for="checkbox-1">${post.title} ${post.category.name} ${post.user.email} </a>
                            </div>
                            <div class="pull-right action-buttons"><a href="/deletePost/${post.id}" class="trash">
                                <em class="fa fa-trash"></em>
                            </a></div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    Users
                    <span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
                <div class="panel-body">
                    <ul class="todo-list">
                        <li class="todo-list-item">
                            <div class="checkbox">
                                <p for="checkbox-1">Name &nbsp; Surname &nbsp; Email</p>
                            </div>
                        </li>
                        <c:forEach items="${allUsers}" var="user">
                            <li class="todo-list-item">
                                <div class="checkbox">

                                    <a href="#" for="checkbox-1">${user.name} ${user.surname} ${user.email}</a>

                                </div>
                                <div class="pull-right action-buttons"><a href="/deleteUser/${user.id}" class="trash">
                                    <em class="fa fa-trash"></em>
                                </a></div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div><!--/.col-->
        <div class="col-sm-12">

        </div>
    </div><!--/.row-->
</div>	<!--/.main-->

<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/chart.min.js"></script>
<script src="/js/chart-data.js"></script>
<script src="/js/easypiechart.js"></script>
<script src="/js/easypiechart-data.js"></script>
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/custom.js"></script>
<script>
    window.onload = function () {
        var chart1 = document.getElementById("line-chart").getContext("2d");
        window.myLine = new Chart(chart1).Line(lineChartData, {
            responsive: true,
            scaleLineColor: "rgba(0,0,0,.2)",
            scaleGridLineColor: "rgba(0,0,0,.05)",
            scaleFontColor: "#c5c7cc"
        });
    };
</script>

</body>
</html>
