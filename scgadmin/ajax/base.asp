<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/xgconn.asp"-->
<%
'conn.execute"update gsjs set gsjstext='"&content&"',type_wj='"&type_wj&"' where gsjsid="&gsjsid&""

id=int(Trim(Request("siteid")))
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from Table_SiteInfo where id="&id,conn,1,3
oRs("sitename")=Trim(Request("SiteName"))
oRs("siteTitle")=Trim(Request("SiteTitle"))
oRs("siteKey")=Trim(Request("SiteKey"))
oRs("siteCont")=Trim(Request("SiteCont"))

oRs("siteUrl")=Trim(Request("SiteURl"))
oRs("siteCopyRight")=Trim(Request("SiteCopyRight"))

oRs("sitebeian")=Trim(Request("Sitebeian"))

oRs("WebMasterName")=Trim(Request("WebMasterName"))
oRs("WebMasterEmail")=Trim(Request("WebMasterEmail"))
oRs("Comail")=Trim(Request("Comail"))
oRs("CoName")=Trim(Request("CoName"))

oRs("CoTel")=Trim(Request("CoTel"))
oRs("CoFax")=Trim(Request("CoFax"))
oRs("CoAddr")=Trim(Request("CoAddr"))

oRs("CoCode")=Trim(Request("CoCode"))
oRs.Update
Set oRs=Nothing%>ok