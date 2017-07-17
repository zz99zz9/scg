<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>后台系统</title>

    <!-- Bootstrap core CSS -->
    <link href="xgwl/css/bootstrap.min.css" rel="stylesheet">
    <link href="xgwl/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="xgwl/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="xgwl/css/style.css" rel="stylesheet">
    <link href="xgwl/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="xgwl/js/html5shiv.js"></script>
    <script src="xgwl/js/respond.min.js"></script>
    <![endif]-->
</head>

  <body class="login-body">

    <div class="container">

     <form name="Form1" action="Login.Asp" method="post" onsubmit="return checkform();" class="form-signin">
        <h2 class="form-signin-heading">后台登录</h2>
        <div class="login-wrap">
            <input type="text" class="form-control" placeholder="用户名" autofocus id="UserName" name="UserName">
            <input type="password" class="form-control" placeholder="密码" id="UserPass" name="UserPass">
<Input type="hidden" name="Action" value="Login" />
            <button class="btn btn-lg btn-login btn-block" type="submit">立即登录</button>
            <p>建议使用Chrome浏览器登录后台</p>


        </div>

      </form>

    </div>
    <!--#include file="inc/xgconn.Asp"-->
    <!--#include file="inc/md5.Asp"-->
<%
if Request.Form("Action")="Login" then
adminname=replace(replace(Trim(Request.Form("username")),"'",""),",","")
adminpass=replace(replace(Trim(Request.Form("userpass")),"'",""),",","")
set rs=server.CreateObject("adodb.recordset")
     sql="select * from [Table_manager] where adminname='"&adminname&"' and adminpass='"&md5(adminpass)&"'"
'	 response.write sql
'	 response.end()
	 rs.open sql,conn,1,1	 
	 if rs.eof then
	 	response.write"<script language='javascript'>alert('用户名或密码错误，请重新登录');history.go(-1);</script>"
   	 else
     	Session.Timeout=999
     	response.cookies("adminname")=adminname  
     	response.Redirect"Pro_List.Asp"
     end if
End if	 
%>
  </body>
</html>
