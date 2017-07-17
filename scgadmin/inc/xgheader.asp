<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--#include file="xgconn.asp"-->
<!--#include file="../../inc/Function.asp"-->
<!--#include file="../../inc/inc.asp"-->
<%if request.cookies("adminname")="" then
response.redirect("login.asp")
end if%>
    <title>后台首页</title>
<link href="xgwl/css/xgwl.css" rel="stylesheet" />
    <!-- Bootstrap core CSS -->
    <link href="xgwl/css/bootstrap.min.css" rel="stylesheet">
    <link href="xgwl/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="xgwl/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="xgwl/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <link rel="stylesheet" href="xgwl/css/owl.carousel.css" type="text/css">
    <!-- Custom styles for this template -->
    <link href="xgwl/css/style.css" rel="stylesheet">
    <link href="xgwl/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="xgwl/js/html5shiv.js"></script>
      <script src="xgwl/js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" class="">
      <!--header start-->
      <header class="header white-bg">
            <div class="sidebar-toggle-box">
                <div data-original-title="Toggle Navigation" data-placement="right" class="icon-reorder tooltips"></div>
            </div>
            <!--logo start-->
            <a href="#" class="logo">后台<span>系统</span></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
   
                    <!-- inbox dropdown start
                    <li id="header_inbox_bar">
                        <a data-toggle="modal" href="#contectxgwl">
                            <i class="icon-globe"></i> 中文
                        </a>
                     
                    </li>-->
                    <!-- inbox dropdown end -->
                    <!-- notification dropdown start-->

                    <!-- notification dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-nav ">
                <!--search & user info start-->
                <ul class="nav pull-right top-menu">
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="xgwl/img/avatar1_small.jpg">
                            <span class="username"><%=request.cookies("adminname")%></span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <!--<li><a data-toggle="modal" href="#viewadmininfo"><i class=" icon-suitcase"></i> 个人信息</a></li>
                            <li><a data-toggle="modal" href="#setadminpass"><i class="icon-cog"></i> 修改密码</a></li>-->
                            <li><a href="LogInout.Asp"><i class="icon-key"></i> 安全退出</a></li>
                        </ul>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!--search & user info end-->
            </div>
        </header>
      <!--header end-->