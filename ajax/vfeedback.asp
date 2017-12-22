<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<%
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from lYb ",conn,1,3
oRs.Addnew
oRs("lyname")=Trim(Request("vname"))
oRs("lytel")=Trim(Request("vtel"))
oRs("lyqq")=Trim(Request("vhdid"))
oRs("lyemail")=Trim(Request("vmail"))
oRs("lytext")=Trim(Request("vcontect"))

oRs.Update
Set oRs=Nothing%>ok